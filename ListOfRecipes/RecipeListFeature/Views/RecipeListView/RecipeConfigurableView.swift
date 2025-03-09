//
//  Untitled.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//
import SwiftUI

protocol RecipeConfigurableView: View {
    init(recipe: Recipe, imageProviding: ImageProviding)
}
