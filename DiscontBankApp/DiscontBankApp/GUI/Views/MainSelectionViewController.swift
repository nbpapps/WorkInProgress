//
//  MainSelectionViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 21/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainSelectionViewController: UIViewController {

    private lazy var BanksButton : UIButton = {
           let b = UIButton(frame: .zero)
           b.setTitle("show banks", for: .normal)
           b.addTarget(self, action: #selector(banksButtonTapped), for: .touchUpInside)
           b.translatesAutoresizingMaskIntoConstraints = false
           return b
       }()
    
    private lazy var settingsButton : UIButton = {
        let b = UIButton(frame: .zero)
        b.setTitle("Settings", for: .normal)
        b.addTarget(self, action: #selector(settingsButtonTapped), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let flowController : MainFlowController
    
    init(flowController : MainFlowController) {
        self.flowController = flowController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        layoutView()
    }
    
    private func layoutView() {
        let stack = UIStackView(arrangedSubviews: [BanksButton,settingsButton])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    
    @objc func banksButtonTapped() {
        flowController.navigate(to: .Banks)
    }
    
    @objc func settingsButtonTapped() {
        flowController.navigate(to: .Settings)
    }
    
}
