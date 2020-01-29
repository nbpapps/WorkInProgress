//
//  UIImageView+Utils.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit


public extension UIImageView {
    func downloadBankImageWithCache(_ bankImageUrlString: String) {        
        //check if we have an image in cache
        if let imageFromCache = ImageCache.shared.getImage(for: bankImageUrlString) {
            self.image = imageFromCache
            return
        }else{
            let dataFetch = DataFetch()
            dataFetch.fetchBankImage(foUrlString: bankImageUrlString) { (result) in
            switch result {
                case .failure(_):
                    DispatchQueue.main.async {
                        self.image = UIImage(named: Strings.placeholder)
                    }
                case .success(let data):
                    if let downloadedImage = UIImage(data: data) {
                        ImageCache.shared.set(image: downloadedImage, for: bankImageUrlString)
                        DispatchQueue.main.async {
                            self.image = downloadedImage
                        }
                    }
                }
            }
        }
    }
}
