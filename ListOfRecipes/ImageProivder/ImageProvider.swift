//
//  ImageProvider.swift
//  ListOfRecipes
//
//  Created by Basheer Malaa on 3/5/25.
//

import UIKit

enum cacheCapacityMB: Int {
    case constrained = 50
    case normal = 150
    case maximum = 300
    
    func sizeInBytes() -> Int {
        rawValue * 1024 * 1024
    }
}

class ImageProvider: ImageProviding {
    
    let cacheCapacity: cacheCapacityMB
    private let imageCache: NSCache<NSString, UIImage>
    private let networking: Networking
    
    init(cacheCapacity: cacheCapacityMB = .normal,
         networking: Networking) {
        self.cacheCapacity = cacheCapacity
        imageCache = NSCache<NSString, UIImage>()
        imageCache.totalCostLimit = cacheCapacity.sizeInBytes()
    
        self.networking = networking
    }
    
    func getImage(with url: URL) async throws -> ImageData {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            return ImageData(image: cachedImage, url: url)
        }
        // do a network call
        let imageData = try await self.networking.execute(operation: ImageNetworkOperation(imageUrl: url))
        imageCache.setObject(imageData.image,
                             forKey: url.absoluteString as NSString)
        return imageData
    }
}
