//
//  RecipeImageOperation.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/3/25.
//
import UIKit

struct ImageData {
    var image: UIImage
    var url: URL
}

class ImageNetworkOperation: NetworkOperationProviding {
    typealias DataResult = ImageData
    
    let imageUrl: URL
    
    init(imageUrl: URL) {
        self.imageUrl = imageUrl
    }
    
    func urlRequest(for baseUrl: URL) -> URLRequest {
        return URLRequest(url: imageUrl)
    }
    
    func convert(_ data: Data) async throws -> DataResult {
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "Could not download image", code: 0, userInfo: nil)
        }
        
        return .init(image: image, url: imageUrl)
    }
}
