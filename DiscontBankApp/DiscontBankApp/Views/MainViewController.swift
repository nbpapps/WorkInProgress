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
    let collectionViewDatasource = BankListDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.shared.selectBankTitle
        view.backgroundColor = .systemBackground
        
        configureCollectionView()
        
    }
    //MARK:- config
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
    
}


