//
//  RecipeListViewModel.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//
import Foundation

private class RecipeListViewDataModel: ObservableObject, RecipeListProvider {
    
    @Published var recipes: [Recipe] = []
    
    func loadRecipes()  {
        Task {
            let networkOp = RecipeListNetworkOperation()
            let networker = AppNetworker()
            do {
                let result = try await networker.execute(operation: networkOp)
                self.recipes = result
            }
        }
        
    }
}

