//
//  SettingsViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 21/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var titleLabel : UILabel = {
        let l = UILabel(frame: .zero)
        l.textAlignment = .center
        l.text = "Settings"
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
        view.backgroundColor = .purple
        
    }
    
    
    private func layoutView() {
        let stack = UIStackView(arrangedSubviews: [titleLabel])
        stack.axis = .vertical
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}
