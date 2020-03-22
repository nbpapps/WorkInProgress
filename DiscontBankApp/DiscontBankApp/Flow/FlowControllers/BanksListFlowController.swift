//
//  BanksListFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 22/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class BanksFlowController : FlowCoordinator {
    
    enum Destination {
       case bankInfo
    }
    
    var navControler : UINavigationController
//    var mainFlowController : MainFlowController
    
    //MARK: - inits
    init(navController : UINavigationController) { //},mainFlowController : MainFlowController) {
        self.navControler = navController
//        self.mainFlowController = mainFlowController
    }
    
    //MARK: - FlowCoordinator protocol
    func start() {
        let banksListViewModel = BanksListViewModel()
        let banksListViewController = BanksListViewController(banksListViewModel: banksListViewModel)
        navControler.pushViewController(banksListViewController, animated: true)
//        let firstOnboardingViewController = OBFirstViewController(flowController: self)
//        navControler.pushViewController(firstOnboardingViewController, animated: false)
    }
    
    func navigate(to destination: Destination) {
//        switch destination {
//        case .NextPage:
//            let secondOnboardingViewController = OBSecondViewController(flowController: self)
//            navControler.pushViewController(secondOnboardingViewController, animated: true)
//        case .Done:
//            mainFlowController.didFinishFlow(for: .OnboardingFlow)
//        }
    }
}
