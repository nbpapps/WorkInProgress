//
//  MainAppViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 13/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

enum Destination {
    case showBankIntraday
}

class MainAppViewController: UIViewController,Navigator {
    
    //MARK: - properties
    private lazy var ownedNavigationController: UINavigationController = {
        UINavigationController(rootViewController: self.banksListViewController)
    }()
    
    private lazy var banksListViewController : BanksListViewController = {
        let bankListVC = BanksListViewController(banksListViewModel: banksListViewModel)
        return bankListVC
    }()
    
    private lazy var banksListViewModel : BanksListViewModel = {
        let banksListViewModel = BanksListViewModel()
        return banksListViewModel
    }()
    
    //MARK: -init
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
