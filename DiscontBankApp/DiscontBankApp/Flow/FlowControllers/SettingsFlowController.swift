//
//  SettingsFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 24/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class SettingsFlowContoller : FlowCoordinator {
    
    enum Destination {

    }
    
    private weak var navControler : UINavigationController?
    
    //MARK: - inits
    init(navController : UINavigationController) {
        self.navControler = navController
    }
    
    //MARK: - FlowCoordinator protocol
    func start() {
        let settingsViewController = SettingsViewController()
        navControler?.pushViewController(settingsViewController, animated: true)
    }
    
    func navigate(to destination: Destination) {

    }

}
