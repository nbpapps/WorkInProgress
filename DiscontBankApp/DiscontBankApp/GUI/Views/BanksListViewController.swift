//
//  BanksListViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 01/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class BanksListViewController: UIViewController, UICollectionViewDelegate {
    
    private lazy var bankListCollectionView = makeCollectionView()
    let banksListViewModel : BanksListViewModel
    weak var flowController : BankInfoFlowController?
    
    //MARK: - init
    init(banksListViewModel : BanksListViewModel,flowController : BankInfoFlowController) {
        self.flowController = flowController
        self.banksListViewModel = banksListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.noStoryboardImplementation)
    }
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    //MARK:- factory
    private func makeCollectionView() -> UICollectionView {
        let colllectionView =  UICollectionView(frame: view.bounds, collectionViewLayout:UIConfig.createFlowLayout(in: view, numberOfColums: Values.numberOfCollectionViewColums))
        return colllectionView
    }
    
    //MARK:- config
    
    func configureCollectionView() {
        view.addSubview(bankListCollectionView)
        bankListCollectionView.backgroundColor = .systemBackground
        bankListCollectionView.register(BankCollectionViewCell.self, forCellWithReuseIdentifier: BankCollectionViewCell.reuseId)
        bankListCollectionView.delegate = self
        bankListCollectionView.dataSource = banksListViewModel
    }
    
    
    func presentBanksList() {
        print("presentBanksList")
        self.bankListCollectionView.reloadData()
    }

    
    //MARK: - collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        flowController?.navigate(to: .showIntradayForBankAt(indexPath: indexPath))
    }
}
