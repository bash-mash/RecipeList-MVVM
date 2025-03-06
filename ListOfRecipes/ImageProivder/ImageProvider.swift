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

class ImageProvider {
    let cacheCapacity: cacheCapacityMB
    private let imageCache: NSCache<NSString, UIImage>
    
    init(cacheCapacity: cacheCapacityMB = .normal) {
        self.cacheCapacity = cacheCapacity
        imageCache = NSCache<NSString, UIImage>()
        imageCache.totalCostLimit = cacheCapacity.sizeInBytes()
    }
}
