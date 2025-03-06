//
//  NetworkOperationProviding.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//

import Foundation

protocol NetworkOperationProviding {
    associatedtype DataResult
    
    //var resultType: DataResult.Type { get }
    
    func urlRequest(for baseUrl: URL) -> URLRequest
    func convert(_ data: Data) async throws -> DataResult
}
