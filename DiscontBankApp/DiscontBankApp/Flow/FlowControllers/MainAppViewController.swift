//
//  MainAppViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 13/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {
    
    private let navigator : BankInfoNavigator
    
    //MARK: -init
    init(navigator: BankInfoNavigator) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigator.navigate(to: .showBankIntraday)
    }
    
    
    
}
