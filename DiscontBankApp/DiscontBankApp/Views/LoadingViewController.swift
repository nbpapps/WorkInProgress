//
//  LoadingViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 29/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemFill
        configureSpiner()
        
    }
    
    private func configureSpiner() {
        
        let spiner = UIActivityIndicatorView(style: .large)
        spiner.translatesAutoresizingMaskIntoConstraints = false
        spiner.startAnimating()
        view.addSubview(spiner)
        
        NSLayoutConstraint.activate([
            spiner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spiner.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
