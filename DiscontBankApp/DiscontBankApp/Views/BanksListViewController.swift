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
//    let bankListCollectionViewDatasource = BankListDataSource()
    let banksListViewModel = BanksListViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionView()
        configureBankListDataSource()
    }
    
    private func makeCollectionView() -> UICollectionView {
        let colllectionView =  UICollectionView(frame: view.bounds, collectionViewLayout:UIConfig.createFlowLayout(in: view, numberOfColums: Values.numberOfCollectionViewColums))
        
        return colllectionView
        
    }
    
    //MARK:- config
    func configureView() {
        title = Strings.selectBankTitle
        view.backgroundColor = .systemBackground
    }
    
    func configureCollectionView() {
        view.addSubview(bankListCollectionView)
        bankListCollectionView.backgroundColor = .systemBackground
        bankListCollectionView.register(BankCollectionViewCell.self, forCellWithReuseIdentifier: BankCollectionViewCell.reuseId)
        bankListCollectionView.delegate = self
        bankListCollectionView.dataSource = banksListViewModel
    }
    
    func configureBankListDataSource() {
        banksListViewModel.extractBankList(from: Bundle.main.data(from: BanksListViewModel.bankListEndPointJson)) {
            DispatchQueue.main.async {
                self.bankListCollectionView.reloadData()
            }
        }
    }
    
    //MARK: - collection view delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destViewController = IntradayViewController()
        if let bank = banksListViewModel.bank(at: indexPath.row) {
            destViewController.bank = bank
            navigationController?.pushViewController(destViewController, animated: true)
        }
    }
}
