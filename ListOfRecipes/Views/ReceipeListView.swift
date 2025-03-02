//
//  ReceipeListView.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import SwiftUI

protocol RecipeListProvider {
    @Published var recipes: [Recipe] { get set }
}

struct ReceipeListView: View {
    var body: some View {
        List {
            
        }
    }
}

#Preview {
    ReceipeListView()
}
