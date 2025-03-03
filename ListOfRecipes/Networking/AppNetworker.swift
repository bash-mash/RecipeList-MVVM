//
//  AppNetworker.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//

import Foundation

class AppNetworker: Networking {
    /*! default is production, but the enum shows this code is scalable to allow
     switching to different endpoints in the future */
    static let baseUrl: BaseUrl = .production
    private var session: NetworkSessionProtocol
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    /*! the NetworkOepration will provide the request (with params) and knows how to parse its data T. The responsibility of this class is only running common code for networking. I.e no features specific code should be here */
    func execute<T: NetworkOperationProviding>(operation: T) async throws -> T.DataResult {
        let request = operation.urlRequest(for: Self.baseUrl.toURL())
        let response = try await session.data(for: request)
        // todo: check the response's code and other data
        
        let results = try JSONDecoder().decode(T.DataResult.self, from: response.0)
        return results
    }
}

/* network session protocol*/
protocol NetworkSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: NetworkSessionProtocol {
}
