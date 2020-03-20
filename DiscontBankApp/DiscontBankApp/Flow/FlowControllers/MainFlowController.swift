//
//  MainFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 20/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainFlowController : FlowCoordinator {
    
    
    enum Destination {
        case OnboardingFlow
        case ShowBanksFlow
    }
    
    var navControler : UINavigationController
    
    //MARK: - inits
    init(navController : UINavigationController) {
        self.navControler = navController
    }
    
    //MARK: - FlowCoordinator protocol
    func start() {
        let banksViewModel = BanksListViewModel()
        let banksListViewController = BanksListViewController(banksListViewModel:banksViewModel)
        navControler.pushViewController(banksListViewController, animated: false)
    }
    
    func navigate(to destination: MainFlowController.Destination) {
        
    }
    
}
