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
       case intradayForBankAt(indexPath: IndexPath)
    }
    
    private weak var navControler : UINavigationController?
    
    private lazy var banksListViewModel : BanksListViewModel = {
        return BanksListViewModel()
    }()

    
    //MARK: - inits
    init(navController : UINavigationController) {
        self.navControler = navController
    }
    
    //MARK: - FlowCoordinator protocol
    func start() {
        let banksListViewController = BanksListViewController(banksListViewModel: banksListViewModel, flowController: self)
        navControler?.pushViewController(banksListViewController, animated: true)
    }
    
    func navigate(to destination: Destination) {
        switch destination {
        case .intradayForBankAt(let indexPath):
            if let bank = banksListViewModel.bank(at: indexPath.row) {
                let bankViewModel = BankViewModel(bank: bank)
                let intradayViewController = IntradayViewController(bankViewModel: bankViewModel, timeIntervals: TimeIntervals())
                navControler?.pushViewController(intradayViewController, animated: true)
            }else{
                //we show an error VC
            }
        }
    }
}
