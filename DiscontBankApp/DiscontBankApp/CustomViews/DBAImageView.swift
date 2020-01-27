//
//  DBAImageView.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class DBAImageView: UIImageView {

    let placeHolderImage = UIImage(named: Strings.shared.placeholder)!

    override init(frame: CGRect) {
           super.init(frame: frame)
           config()
       }
       
       required init?(coder: NSCoder) {
        fatalError(Strings.shared.noStoryboradImplementation)
       }
       
       private func config() {
        layer.cornerRadius = Values.shared.imageViewCornerRadius
           clipsToBounds = true
           image = placeHolderImage
           translatesAutoresizingMaskIntoConstraints = false
       }

}
