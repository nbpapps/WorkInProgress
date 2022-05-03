//
//  MainFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 20/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainFlowController : NSObject,ParentFlowCoordinator,UINavigationControllerDelegate {
    
    enum Destination {
        case OnboardingFlow
        case Banks
        case Settings
    }
    
    private var navControler : UINavigationController
    
//    #warning("I tryied to use an array of child FlowControllers, but the compiler could not infer their type")
    private var onboardingFlowController : OnboardingFlowController?
    private var banksFlowController : BanksFlowController?
    private var settingsFlowController : SettingsFlowContoller?
        
    //MARK: - inits
    init(navController : UINavigationController) {
        self.navControler = navController
    }
    
    //MARK: - FlowCoordinator protocol
    func start() {
        navControler.delegate = self
        showMainSelectionScreen(forAppLuanch: true)//we always start with the main screen. it will be our root VC. if we need to show the OB, we just transition to it afterwards

        if !UserDefaultsConfig.hasSeenOnboarding {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.startOnboardingFlow()
            }
        }
    }
    
    //MARK: - flow destinations
    private func showMainSelectionScreen(forAppLuanch appLuanch : Bool) {
        if appLuanch {
           let mainAppScreen = MainSelectionViewController(flowController: self)
           navControler.pushViewController(mainAppScreen, animated: false)
        }else{
            //if we are transitioning to a new flow, we nedd to "clear" the nav controller from all other VCs
            navControler.popToRootViewController(animated: true)
            navControler.setNavigationBarHidden(false, animated: true)//the back button should only be shown when we are in the main flow and the user selected am action (banks,setting)
        }
    }
    
    private func startOnboardingFlow() {
        navControler.setNavigationBarHidden(true, animated: false)//the back button should only be shown when we are in the main flow and the user selected am action (banks,setting)

        onboardingFlowController = OnboardingFlowController(navController: navControler, mainFlowController: self)
        onboardingFlowController?.start()
    }
    
    private func startBanksFlow() {
        banksFlowController = BanksFlowController(navController: navControler)
        banksFlowController?.start()
    }
    
    private func startSettingFlow() {
        settingsFlowController = SettingsFlowContoller(navController: navControler)
        settingsFlowController?.start()
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
    
    //MARK: - calls when flow finish by actions (e.g. done button)
    func didFinishFlow(for destination: Destination) {
        switch destination {
        case .OnboardingFlow:
            didFinishOnboarding()
        case .Banks:
            break
        case .Settings:
            break
        }
    }
    
    private func didFinishOnboarding() {
        UserDefaultsConfig.hasSeenOnboarding = true
        onboardingFlowController = nil
        showMainSelectionScreen(forAppLuanch: false)
    }
    
    private func didMoveBackToMainScreen() {
        banksFlowController = nil
        settingsFlowController = nil
    }
    
    //MARK: - nav controller delegate
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let _ = navigationController.transitionCoordinator?.viewController(forKey: .to) as? MainSelectionViewController {
            //we know we are moving to the MainSelectionViewController, so we can "nil" all the FCs
            didMoveBackToMainScreen()
        }
    }
    
}
