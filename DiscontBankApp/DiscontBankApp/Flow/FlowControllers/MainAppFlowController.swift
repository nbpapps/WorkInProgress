//
//  MainAppFlowController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 15/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

enum Destination {
    case showIntradayForBankAt(indexPath : IndexPath)
}

class MainAppFlowController: UIViewController,Navigator {
    
    //MARK: - properties
    private lazy var ownedNavigationController: UINavigationController = {
        UINavigationController(rootViewController: self.banksListViewController)
    }()
    
    private lazy var banksListViewController : BanksListViewController = {
        let bankListVC = BanksListViewController(banksListViewModel: banksListViewModel, flowController: self)
        bankListVC.view.backgroundColor = .systemBackground
        bankListVC.title = Strings.selectBankTitle
        return bankListVC
    }()
    
    private lazy var banksListViewModel : BanksListViewModel = {
        let banksListViewModel = BanksListViewModel()
        return banksListViewModel
    }()
    
    //MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialBanksData()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .clear
        add(ownedNavigationController)
    }
    
    //MARK: - load initial data
    private func loadInitialBanksData() {
        banksListViewModel.extractBankList(from: Bundle.main.data(from: BanksListViewModel.bankListEndPointJson)) { [weak self] in
            DispatchQueue.main.async {
                self?.banksListViewController.presentBanksList()
            }
        }
    }
    
    //MARK:- Navigator protocol
    
    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        ownedNavigationController.pushViewController(viewController, animated: true)
    }
    
    
    //MARK: - make VC for destination
    private func makeViewController(for destination : Destination) -> UIViewController {

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
