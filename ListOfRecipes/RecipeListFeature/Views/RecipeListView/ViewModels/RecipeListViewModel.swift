//
//  RecipeListViewModel.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//
import Foundation

class RecipeListViewDataModel: ObservableObject, RecipeListProvider {
    @Published var recipes: [Recipe] = []
    
    let networker: Networking
    
    init(_ networking: Networking) {
        self.networker = networking
    }
    
    func loadRecipes() async throws {
        let networkOp = RecipeListNetworkOperation()
        let result = try await networker.execute(operation: networkOp)
        await MainActor.run {
            self.recipes = result.recipes
        }
    }
}

