//
//  RecipeListNetworkOperationTests.swift
//  ListOfRecipesTests
//
//  Created by Basheer Malaa on 3/9/25.
//

import XCTest
@testable import ListOfRecipes

final class RecipeListNetworkOperationTests: XCTestCase {

    func getJsonData() -> Data {
        let bundle = Bundle(for: self.classForCoder)
        guard let url = bundle.url(forResource: "recipes2", withExtension: "json") else {
                XCTFail("Failed to find file in bundle")
                return Data()
            }
        
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("could not get data")
            return Data()
        }
        return data
    }
    
    func testOperationParseSuccess() {
        let jsonData = getJsonData()
        let operation = RecipeListNetworkOperation()
        Task {
            let parsed = try? await operation.convert(jsonData)
            XCTAssertNotNil(parsed)
            XCTAssertTrue(parsed?.recipes.isEmpty == false)
        }
    }
}
