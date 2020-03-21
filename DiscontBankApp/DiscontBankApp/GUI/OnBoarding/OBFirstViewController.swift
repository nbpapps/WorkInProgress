//
//  OBFirstViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 21/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class OBFirstViewController: UIViewController {

    private lazy var titleLabel : UILabel = {
        let l = UILabel(frame: .zero)
        l.textAlignment = .center
        l.text = "First Onboarding screen"
        l.translatesAutoresizingMaskIntoConstraints = false

        return l
    }()
    
    private lazy var nextButton : UIButton = {
        let b = UIButton(frame: .zero)
        b.setTitle("next", for: .normal)
        b.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
        
        
    }
    
    private func layoutView() {
        let stack = UIStackView(arrangedSubviews: [titleLabel,nextButton])
        stack.axis = .vertical
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    
    @objc func nextButtonTapped() {
        
    }
    
}
