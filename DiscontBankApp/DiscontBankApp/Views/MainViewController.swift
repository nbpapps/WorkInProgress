//
//  MainViewController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var collectionView : UICollectionView!
    let collectionViewDatasource = BankListDataSource(with:Bundle.main.data(from: Strings.shared.banksJson))

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionView()
    }
    
    //MARK:- config
    func configureView() {
        title = Strings.shared.selectBankTitle
        view.backgroundColor = .systemBackground
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout:UIConfig.createFlowLayout(in: view, numberOfColums: Values.shared.numberOfCollectionViewColums))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(BankCollectionViewCell.self, forCellWithReuseIdentifier: BankCollectionViewCell.reuseId)
        collectionView.delegate = self
        collectionView.dataSource = collectionViewDatasource
    }
}

extension MainViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destViewController = IntradayViewController()
        destViewController.bank = collectionViewDatasource.bank(at: indexPath.row)
        navigationController?.pushViewController(destViewController, animated: true)
    }
}


