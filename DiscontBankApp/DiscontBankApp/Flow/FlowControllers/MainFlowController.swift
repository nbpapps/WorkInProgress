//
//  MainFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 16/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainFlowController: UIViewController {

    var mainNavigationController : UINavigationController
//    var children = [Coordinator]()
    
    init(mainNavigationController: UINavigationController) {
        self.mainNavigationController = mainNavigationController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
    
    override func loadView() {
        //this is where the flow "starts"
    }
    
}
