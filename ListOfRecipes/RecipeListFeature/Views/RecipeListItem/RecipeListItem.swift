//
//  RecipeListItem.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import SwiftUI

struct RecipeListItem: View, RecipeConfigurableView {
    @State var recipe: Recipe
    @State private var task: Task<Void, Error>?
    @State private var image: UIImage?
    
    let imageProviding: ImageProviding
    
    init(recipe: Recipe, imageProviding: ImageProviding) {
        self.recipe = recipe
        self.imageProviding = imageProviding
    }
    
    var body: some View {
        HStack {
            Image(uiImage: self.image ?? UIImage.strokedCheckmark)
                .resizable()
                .frame(width: 60, height: 60)
            Text("Name: \(recipe.name), Cuisine: \(recipe.cuisine)")
                .font(.caption)
        }
        .task {
            guard let urlStr = recipe.photoUrlSmall,
                  let url = URL(string: urlStr) else {
                // set default image
                self.image = nil
                return
            }
            let image = try? await imageProviding.getImage(with: url)
            self.image = image?.image
        }
        .padding(10)
    }
}
