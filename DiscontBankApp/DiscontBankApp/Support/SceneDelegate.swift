//
//  SceneDelegate.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//    #warning("""
//            I added the coordinator pattern. I have a main flow controller and 3 child FCs.
//            I also seperated the intraday screen to a Logic Controller and View Controller
//            I added an error message screen. I just could not figure out if there could be a way to add it as a child VC and have a cross disolve option (see presentAlertWith method for example)
//    """)

    var window: UIWindow?
    var mainCoordinator : MainFlowController?

    let testingScreen = false
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
//        UserDefaultsConfig.hasSeenOnboarding = false

        window = UIWindow(frame: windowScene.coordinateSpace.bounds) //fill the screen
        window?.windowScene = windowScene
        
        //the app is build around a navigation
        let navController = UINavigationController()
        
        //the main flow controller will start the flow
        mainCoordinator = MainFlowController(navController: navController)
        mainCoordinator?.start()
        
        if testingScreen {
            //if we want to test out how a specific VC is seen.
            let bank = Bank(name: "Test", stk: "BAC", img: "", priority: "")
            let bankViewModel = BankViewModel(bank: bank)
            let timeIntervals = TimeIntervals()
            let logicCntrl = IntradayLogicController()
            let shownScreen = IntradayViewController(bankViewModel: bankViewModel, timeIntervals: timeIntervals, logicController: logicCntrl)
            window?.rootViewController = shownScreen
        }else{
            window?.rootViewController = navController //set the root VC we want to show

        }
        
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

