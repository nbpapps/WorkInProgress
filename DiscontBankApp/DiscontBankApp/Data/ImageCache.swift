//
//  ImageCache.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 29/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

struct ImageCache {
    static let shared = ImageCache()
    
     var imageCache = NSCache<NSString, UIImage>()
    
    func getImage(for key : String) -> UIImage? {
        return imageCache.object(forKey: NSString(string: key))
    }
    
    func set(image : UIImage, for key : String) {
        imageCache.setObject(image, forKey: NSString(string: key))
    }
}
