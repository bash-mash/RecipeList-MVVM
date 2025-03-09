//
//  ReceipeListView.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import SwiftUI

struct RecipeListView<T: RecipeListProviding>: View {
    @StateObject var recipeListProvider: T
    
    var body: some View {
        NavigationView {
            listView()
            .navigationTitle("Recipe List")
        }
        .refreshable {
            loadRecipes()
        }
        .onAppear {
            loadRecipes()
        }
    }
    
    private func listView() -> some View {
        List(recipeListProvider.recipes) { recipe in
            RecipeListItem(recipe: recipe, imageProviding: recipeListProvider.imageProviding)
        }
    }
    
    private func loadRecipes() {
        Task {
            do {
                try self.recipeListProvider.loadRecipes()
            } catch {
                print("error loading recipes: \(error)")
            }
        }
    }
}

#Preview {
    RecipeListView(recipeListProvider: RecipeListViewModel(AppNetworker()))
}

/* Todo: remove (mocked viewModel)
private class RecipeListProviderMock: ObservableObject, RecipeListProviding {
   
    var imageProviding: any ImageProviding
    var networker = AppNetworker()
    
    init() {
        imageProviding = ImageProvider(networking: networker)
    }
    
    @Published var recipes: [Recipe] =
    [
        Recipe(uuid: "1", name: "One", cuisine: "Cuisine1", photoUrlLarge: nil, photoUrlSmall: nil, sourceUrl: nil, youtubeUrl: nil)
    ]
    
    func loadRecipes() {
    }
}
*/
