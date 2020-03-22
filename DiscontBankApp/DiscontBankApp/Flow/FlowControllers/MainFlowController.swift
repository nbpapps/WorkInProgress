//
//  MainFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 20/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainFlowController : FlowCoordinator,HigherOrderFlowCoordinator {
    
    enum Destination {
        case OnboardingFlow
        case Banks
        case Settings
    }
    
    private var navControler : UINavigationController
    private var onboardingFlowController : OnboardingFlowController?
    
    //MARK: - inits
    init(navController : UINavigationController) {
        self.navControler = navController
    }
    
    //MARK: - FlowCoordinator protocol
    func start() {
        navControler.setNavigationBarHidden(true, animated: false)//the back button should on;y be shown when we are in the main flow and the user selected am action (banks,setting)
        
        if UserDefaultsConfig.hasSeenOnboarding {
            //if the user has already seen the On-boarding, we will show the main screen
            showMainSelectionScreen(forAppLuanch: true)
        }else{
            startOnboardingFlow()//if not, we will show the On-boarding
        }
    }
    
    //MARK: - flow destinations
    private func showMainSelectionScreen(forAppLuanch appLuanch : Bool) {
        if !appLuanch {
            //if we are transitioning to a new flow, we nedd to "clear" the nav controller from all other VCs
            navControler.popToRootViewController(animated: false)
        }
        
        let mainAppScreen = MainSelectionViewController(flowController: self)
        navControler.pushViewController(mainAppScreen, animated: false)//if we set the animated to true (!appLuanch), we see a sliver of the RootForNavVC during to transition. is there something else that could be done?
    }
    
    private func startOnboardingFlow() {
        onboardingFlowController = OnboardingFlowController(navController: navControler, mainFlowController: self)
        onboardingFlowController?.start()
    }
    
    private func startBanksFlow() {
        let banksFlowController = BanksFlowController(navController: navControler)
        banksFlowController.start()
    }
    
    private func startSettingFlow() {
        
    }
    
    
    
    //MARK:- protocol action
    func navigate(to destination: Destination) {
        switch destination {
        case .OnboardingFlow:
        break //for now this had no action to take. It could be implemented if we add a section in the settings screen to show the onboarding again
        case .Banks:
            startBanksFlow()
        case .Settings:
            startSettingFlow()
        }
    }
    
    func didFinishFlow(for destination: Destination) {
        switch destination {
        case .OnboardingFlow:
            didFinishOnboarding()
        case .Banks:
            print("")
        case .Settings:
            print("")
            
        }
    }
    
    private func didFinishOnboarding() {
        UserDefaultsConfig.hasSeenOnboarding = true
        onboardingFlowController = nil
        showMainSelectionScreen(forAppLuanch: false)
    }
    
    //MARK: - helper
//    private func makeViewController(for destination : Destination) -> UIViewController {
//        switch destination {
//        case .OnboardingFlow:
//            break
//        case .BanksList:
//           print("")
//        case .Settings:
//            print("")
//        }
//    }
    
}
