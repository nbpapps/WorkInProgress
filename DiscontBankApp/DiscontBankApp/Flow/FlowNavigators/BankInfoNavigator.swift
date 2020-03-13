//
//  BankInfoNavigator.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 13/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class BankInfoNavigator : Navigator {
    
    enum Destination {
        case showBankIntraday
    }
    
    private weak var navigationController : UINavigationController?
    
    //MARK:- init
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK:- Navigator protocol
    
    func navigate(to destination: BankInfoNavigator.Destination) {
        let viewController = makeViewController(for : destination)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    //MARK: - make VC for destination
    
    private func makeViewController(for destination : Destination) -> UIViewController {
        switch destination {
        case .showBankIntraday:
            return LoadingViewController()
        }
    }
    
    
}
