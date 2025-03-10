//
//  Untitled.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//
import SwiftUI

protocol RecipeListProviding: ObservableObject {
    var recipes: [Recipe] { get set }
    var imageProviding: ImageProviding { get }
    
    func loadRecipes() async throws
}


