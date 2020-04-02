//
//  OBFirstViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 21/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class OBFirstViewController: UIViewController {
    
    let flowController : OnboardingFlowController
    
    init(flowController : OnboardingFlowController) {
        self.flowController = flowController
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        view.backgroundColor = .blue
        layoutView()
    }
    
    private func layoutView() {
        let stack = UIStackView(arrangedSubviews: [titleLabel,nextButton])
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
    
    
    @objc func nextButtonTapped() {
        flowController.navigate(to: .NextPage)
    }
    
}
