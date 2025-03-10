//
//  NetworkOperationProviding.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//

import Foundation

/*! the concrete operation could live on the app level if it's shared (e.g. ImageNetworkOperation) or on the feature's side (e.g. RecipeListNetworkOperation).
 */
protocol NetworkOperationProviding {
    associatedtype DataResult
    
    /*! The operation will be responsible for creating a request. The request will have everything required for a network operation to run */
    func urlRequest(for baseUrl: URL) -> URLRequest
    /*! The operation know how to parse the results, so that's its own responsibility */
    func convert(_ data: Data) async throws -> DataResult
}
