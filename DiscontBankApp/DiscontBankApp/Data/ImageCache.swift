////
////  ImageCache.swift
////  DiscontBankApp
////
////  Created by niv ben-porath on 29/01/2020.
////  Copyright © 2020 nbpApps. All rights reserved.
////
//
//import UIKit
//
//struct ImageCache {
//    static let shared = ImageCache()
//    
//    private var imageCache = NSCache<NSString, UIImage>()
//    
//    private var queue = DispatchQueue(label: "imageCache.queue", attributes: .concurrent)
//
//    func getImage(for key : String) -> UIImage? {
//        
//        return queue.sync {
//            imageCache.object(forKey: NSString(string: key))
//        }
//        
////        return imageCache.object(forKey: NSString(string: key))
//    }
//    
//    func set(image : UIImage, for key : String) {
//        
//        queue.sync(flags: .barrier) {
//            imageCache.setObject(image, forKey: NSString(string: key))
//        }
//        
//        
////        imageCache.setObject(image, forKey: NSString(string: key))
//    }
//}
