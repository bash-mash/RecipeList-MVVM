//
//  RecipeListNetworkOperation.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//
import Foundation

class RecipeListNetworkOperation: NetworkOperationProviding {
    typealias DataResult = [Recipe]
    
    func urlRequest(for baseUrl: URL) -> URLRequest {
        let url = baseUrl.appendingPathComponent("recipes")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    func handleData(_ data: Data) async throws -> DataResult {
        let decoder = JSONDecoder()
        return try decoder.decode(DataResult.self, from: data)
    }
    
}
