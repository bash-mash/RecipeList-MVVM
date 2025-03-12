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
    
    private let imageCache: ImageCache
    private let networking: Networking
    
    init(cacheCapacity: cacheCapacityMB = .normal,
         networking: Networking) {
        self.imageCache = ImageCache(cacheCapacity: cacheCapacity)
        self.networking = networking
    }
    
    func getImage(with url: URL) async throws -> ImageData {
        if let cachedImage = await imageCache.getImage(with: url) {
            return ImageData(image: cachedImage, url: url)
        }
        // do a network call
        let imageData = try await self.networking.execute(operation: ImageNetworkOperation(imageUrl: url))
        await imageCache.setImage(imageData.image,
                             forKey: url.absoluteString)
        return imageData
    }
}

private actor ImageCache {
    let cacheCapacity: cacheCapacityMB
    private let cache: NSCache<NSString, UIImage>
    
    init(cacheCapacity: cacheCapacityMB = .normal) {
        self.cacheCapacity = cacheCapacity
        cache = NSCache<NSString, UIImage>()
        cache.totalCostLimit = cacheCapacity.sizeInBytes()
    }
    
    func getImage(with url: URL) -> UIImage? {
        return cache.object(forKey: url.absoluteString as NSString)
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
