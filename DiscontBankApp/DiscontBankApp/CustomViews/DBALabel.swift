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
        fatalError(Strings.shared.noStoryboradImplementation)
    }
    
    init(textAlignment : NSTextAlignment, fontSize : CGFloat,weight : UIFont.Weight) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        configure()
                    
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
