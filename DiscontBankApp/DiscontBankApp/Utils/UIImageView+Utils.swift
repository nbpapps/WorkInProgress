//
//  UIImageView+Utils.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

private let imageCache = NSCache<AnyObject, AnyObject>()

public extension UIImageView {
    func downloadBankImageWithCache(_ bankImageUrlString: String) {        
        //check if we have an image in cache
        image = UIImage(named: Strings.placeholder)
        if let imageFromCache = imageCache.object(forKey: bankImageUrlString as AnyObject) as? UIImage {
            self.image = imageFromCache
        }else{
            let dataFetch = DataFetch()
            dataFetch.fetchBankImage(foUrlString: bankImageUrlString) { (result) in
            switch result {
                case .failure(_): break //if we fail to fetch an image, we will not do anything special
                case .success(let data):
                    if let downloadedImage = UIImage(data: data) {
                        imageCache.setObject(downloadedImage, forKey: bankImageUrlString as AnyObject)
                        DispatchQueue.main.async {
                            self.image = downloadedImage
                        }
                    }
                }
            }
        }
    }
}
