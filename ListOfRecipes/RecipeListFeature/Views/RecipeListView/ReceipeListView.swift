//
//  ReceipeListView.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import SwiftUI

struct ReceipeListView<T: RecipeListProvider>: View {
    @StateObject var recipeListProvider: T
    

    var body: some View {
        List(recipeListProvider.recipes) { recipe in
            RecipeListItem(recipe: recipe)
        }
    }
}


//mark - Preview

#Preview {
    ReceipeListView(recipeListProvider: RecipeListProviderMock())
}

private class RecipeListProviderMock: ObservableObject, RecipeListProvider {
    
    @Published var recipes: [Recipe] =
    [
        Recipe(uuid: "1", name: "One", cuisine: "Cuisine1", photoUrlLarge: nil, photoUrlSmall: nil, sourceUrl: nil, youtubeUrl: nil)
    ]
    
    func loadRecipes() {
    }
}
