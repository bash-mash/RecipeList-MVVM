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
        
    enum CodingKeys: String, CodingKey {
        case uuid
        case name
        case cuisine
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl
        case youtubeUrl = "youtube_url"
    }
}

extension Recipe: Identifiable {
    var id: String {
        return uuid
    }
}
