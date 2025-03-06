//
//  ImageProviding.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/5/25.
//

import Foundation

protocol ImageProviding {
    func getImage(with url: URL) async throws -> ImageData
}
