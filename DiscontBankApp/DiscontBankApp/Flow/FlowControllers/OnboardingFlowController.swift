//
//  OnboardingFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 21/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class OnboardingFlowController : FlowCoordinator {
    
    enum Destination {
        case NextPage
        case Done
    }
    
    var navControler : UINavigationController
    var mainFlowController : MainFlowController
    
    //MARK: - inits
    init(navController : UINavigationController,mainFlowController : MainFlowController) {
        self.navControler = navController
        self.mainFlowController = mainFlowController
    }
    
    //MARK: - FlowCoordinator protocol
    func start() {
        let firstOnboardingViewController = OBFirstViewController(flowController: self)
        navControler.pushViewController(firstOnboardingViewController, animated: false)
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .NextPage:
            let secondOnboardingViewController = OBSecondViewController(flowController: self)
            navControler.pushViewController(secondOnboardingViewController, animated: true)
        case .Done:
            mainFlowController.didFinishFlow(for: .OnboardingFlow)
        }
    }
}
