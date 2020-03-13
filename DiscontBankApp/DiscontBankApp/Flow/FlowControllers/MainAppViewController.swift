//
//  MainAppViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 13/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainAppViewController: UIViewController {
    
    private lazy var ownedNavigationController: UINavigationController = {
           UINavigationController(rootViewController: )
       }()
    
    //MARK: -init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
//    init(mainAppNavController : UINavigationController) {
//        self.mainAppNavController = mainAppNavController
//        super.init(nibName: nil, bundle: nil)
//    }
    
    
//    init(navigator: BankInfoNavigator) {
//        self.navigator = navigator
//        super.init(nibName: nil, bundle: nil)
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
//        self.navigator.navigate(to: .showBankIntraday)
    }
    
    
    
}
