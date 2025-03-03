//
//  Networking.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//

import Foundation

protocol Networking {
    static var baseUrl: BaseUrl { get }
    
    func execute<T: NetworkOperationProviding>(operation: T) async throws -> T.DataResult
}

enum BaseUrl: String {
    /*! for now we only have production, we will update once we have end points*/
    case production =  "https://d3jbb8n5wk0qxi.cloudfront.net"
    
    @available(*, unavailable, message: "use .production")
    case staging = "https://staging.d3jbb8n5wk0qxi.cloudfront.net"
    @available(*, unavailable, message: "use .production")
    case test = "https://test.d3jbb8n5wk0qxi.cloudfront.net"
    
    func toURL() -> URL {
        URL(string: rawValue)!
    }
}
