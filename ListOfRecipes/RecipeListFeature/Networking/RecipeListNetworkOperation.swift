//
//  RecipeListNetworkOperation.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//
import Foundation

class RecipeListNetworkOperation: NetworkOperationProviding {
    typealias DataResult = RecipeListResponse
    
    func urlRequest(for baseUrl: URL) -> URLRequest {
        let url = baseUrl.appendingPathComponent("recipes.json")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    func convert(_ data: Data) async throws -> DataResult {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(DataResult.self, from: data)
    }
    
}
