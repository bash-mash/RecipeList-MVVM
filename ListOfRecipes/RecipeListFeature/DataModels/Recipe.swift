//
//  Recipe.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/1/25.
//

import Foundation
                                                                                   
struct Recipe: Codable {
    let uuid: String
    let name: String
    let cuisine: String
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let sourceUrl: String?
    let youtubeUrl: String?
}

extension Recipe: Identifiable {
    var id: String {
        return uuid
    }
}
