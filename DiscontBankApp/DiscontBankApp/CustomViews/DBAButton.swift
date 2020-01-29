//
//  DBAButton.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 29/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class DBAButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        //this is the init for story board
        fatalError(Strings.noStoryboradImplementation)
    }
    
    
    init(backgroundColor : UIColor = UIColor(named: Strings.appMainColor) ?? .green,title : String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.label, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline) //this is for dynamic type
        translatesAutoresizingMaskIntoConstraints = false //this will let us use AutoLayout!!!
    }
}
