//
//  ReceipeListView.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import SwiftUI

struct RecipeListView<T: RecipeListProviding>: View {
    @StateObject var recipeListProvider: T
    @State private var error: NSError?
    
    var body: some View {
        NavigationView {
            if error == nil {
                listView()
                    .navigationTitle("Recipe List")
            } else {
                Text("Could not load recipes 🥺")
            }
        }
        .refreshable {
            loadRecipes()
        }
        .task {
            loadRecipes()
        }
    }
    
    private func listView() -> some View {
        List(recipeListProvider.recipes) { recipe in
            RecipeListRow(recipe: recipe, imageProviding: recipeListProvider.imageProviding)
        }
    }
    
    private func loadRecipes() {
        Task {
            do {
                self.error = nil
                try await self.recipeListProvider.loadRecipes()
            } catch (let error as NSError) {
                print("error loading recipes: \(error)")
                await MainActor.run {
                    self.error = error
                }
            }
        }
    }
}

#Preview {
    //todo: use test endpoint or mocked model
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
