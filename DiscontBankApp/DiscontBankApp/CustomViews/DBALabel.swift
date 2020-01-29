//
//  DBALabel.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class DBALabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.noStoryboradImplementation)
    }
    
    init(textAlignment : NSTextAlignment, fontSize : CGFloat,weight : UIFont.Weight,color : UIColor = .label) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        self.textColor = color
        configure()
                    
    }
    
    private func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = Values.minimumScaleFactor
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
