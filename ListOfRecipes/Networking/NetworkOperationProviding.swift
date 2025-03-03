//
//  NetworkOperationProviding.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//

import Foundation

protocol NetworkOperationProviding {
    associatedtype DataResult: Codable
    
    //var resultType: DataResult.Type { get }
    
    func urlRequest(for baseUrl: URL) -> URLRequest
    func handleData(_ data: Data) async throws -> DataResult
}
