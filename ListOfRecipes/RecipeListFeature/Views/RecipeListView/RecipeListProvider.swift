//
//  Untitled.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//
import SwiftUI

protocol RecipeListProvider: ObservableObject {
    var recipes: [Recipe] { get set }
    
    func loadRecipes() async throws
}


