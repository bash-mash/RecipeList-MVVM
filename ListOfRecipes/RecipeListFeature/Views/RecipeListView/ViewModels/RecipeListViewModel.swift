//
//  RecipeListViewModel.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/2/25.
//
import Foundation

class RecipeListViewModel: ObservableObject, RecipeListProviding {
    @Published var recipes: [Recipe] = []
    
    let networker: Networking
    let imageProviding: ImageProviding
    
    init(_ networking: Networking) {
        self.networker = networking
        self.imageProviding = ImageProvider(networking: networking)
    }
    
    func loadRecipes() throws {
        Task {
            let networkOp = RecipeListNetworkOperation()
            let result = try await networker.execute(operation: networkOp)
            await MainActor.run {
                self.recipes = result.recipes
            }
        }
    }
}

