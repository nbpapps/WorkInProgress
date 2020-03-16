//
//  DBASegmentControl.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 29/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class DBASegmentControl: UISegmentedControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.noStoryboardImplementation)
    }
    
    private func configure() {
        selectedSegmentIndex = 0
        selectedSegmentTintColor = .mainColor
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false //this will let us use AutoLayout!
    }
}
