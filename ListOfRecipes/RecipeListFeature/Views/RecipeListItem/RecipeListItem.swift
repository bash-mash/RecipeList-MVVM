//
//  RecipeListItem.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import SwiftUI

struct RecipeListItem: View, RecipeConfigurableView {
    var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage.strokedCheckmark)
            Text("Name: \(recipe.name), Cuisine: \(recipe.cuisine)")
                .font(.caption)
        }
        .padding(10)
    }
}

#Preview {
    RecipeListItem(recipe: Recipe(uuid: "", name: "Test Name", cuisine: "Test Cuisine", photoUrlLarge: nil, photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", sourceUrl: nil, youtubeUrl: nil))
}
