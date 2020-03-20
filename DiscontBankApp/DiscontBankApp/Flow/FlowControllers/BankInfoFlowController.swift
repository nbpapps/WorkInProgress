//
//  BankInfoFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 16/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class BankInfoFlowController: UIViewController,BankInfoNavigator {
    
    enum BankInfoDestination {
        case showIntradayForBankAt(indexPath : IndexPath)
    }
    
    //MARK: - properties
//    weak var navController : UINavigationController?
    weak var parentFlowController : MainAppFlowController?
    
    private lazy var banksListViewController : BanksListViewController = {
        let bankListVC = BanksListViewController(banksListViewModel: banksListViewModel, flowController: self)
        bankListVC.view.backgroundColor = .purple// .systemBackground
        bankListVC.title = Strings.selectBankTitle
        return bankListVC
    }()
    
    private lazy var banksListViewModel : BanksListViewModel = {
        let banksListViewModel = BanksListViewModel()
        return banksListViewModel
    }()
    
    //MARK: - init
    init(parentFlowController : MainAppFlowController) {
//        init(navController : UINavigationController,parentFlowController : MainAppFlowController) {

//        self.navController = navController
        self.parentFlowController = parentFlowController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.noStoryboardImplementation)
    }
    
    //MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("viewDidLoad")
        showBanksListViewController()
        loadInitialBanksData()
    }
    
//    override func loadView() {
//        view = UIView()
//        view.backgroundColor = .orange
//        print("loadView")
//        loadInitialBanksData()
//
////        self.parentFlowController?.ownedNavigationController.pushViewController(self.banksListViewController, animated: false)
//
////        view = UIView()
////        view.backgroundColor = .clear
//    }
    
    private func showBanksListViewController() {
//        parentFlowController?.ownedNavigationController.pushViewController(banksListViewController, animated: false)
        parentFlowController?.ownedNavigationController.show(banksListViewController, sender: self)
        parentFlowController?.ownedNavigationController
    }
    
    
    //MARK: - load initial data
    private func loadInitialBanksData() {
        print("loadInitialBanksData")
        banksListViewModel.extractBankList(from: Bundle.main.data(from: BanksListViewModel.bankListEndPointJson)) { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                print("done loadInitialBanksData")
                self.banksListViewController.presentBanksList()
            }
        }
    }
    
    //MARK:- Navigator protocol
    
    func navigate(to destination: BankInfoDestination) {
        let viewController = makeViewController(for: destination)
        parentFlowController?.ownedNavigationController.pushViewController(viewController, animated: true)
    }
    
    //MARK: - make VC for destination
    private func makeViewController(for destination : BankInfoDestination) -> UIViewController {
        
        switch destination {
        case .showIntradayForBankAt(indexPath: let indexPath):
            if let bank = banksListViewModel.bank(at: indexPath.row) {
                let bankViewModel = BankViewModel(bank: bank)
                return IntradayViewController(bankViewModel: bankViewModel, timeIntervals: TimeIntervals())
            }
                
            else{
                //TODO: show error VC
                return UIViewController()
            }
        }
    }
    
}
