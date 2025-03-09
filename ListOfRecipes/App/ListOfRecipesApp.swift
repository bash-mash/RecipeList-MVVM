//
//  ListOfRecipesApp.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import SwiftUI
import SwiftData

@main
struct ListOfRecipesApp: App {
    @State var mainAppNetworking = AppNetworker()
    
    var body: some Scene {
        WindowGroup {
            ContentView(networking: mainAppNetworking)
        }
    }
}
