//
//  ContentView.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import SwiftUI
import SwiftData

// the main contentview does not display UI, only present features' UI
struct ContentView: View {
     var networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    var body: some View {
        getMainFeatureView()
    }
    
    func getMainFeatureView() -> some View {
        ReceipeListView(recipeListProvider: RecipeListViewDataModel(networking))
    }
}
