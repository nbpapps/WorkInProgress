//
//  BankListDataSource.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

final class BankListDataSource : NSObject, UICollectionViewDataSource {
    
    private var bankList : [Bank]!
    
    init(with data : Data) {
        let banksParser = JsonParser(data: data)
        let banksResult : Result<[Bank],JsonError> = banksParser.decode()
        switch banksResult {
        case .success(let banks):
            bankList = banks.sorted(by: { (lhs, rhs) -> Bool in
                guard let lhsPriority = Int(lhs.priority), let rhsPriority = Int(rhs.priority) else{
                    return false
                }
                return lhsPriority > rhsPriority
            })
            print(banks)
        case .failure(let error):
            print(error)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bankList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankCollectionViewCell.reuseId, for: indexPath) as? BankCollectionViewCell else {
            preconditionFailure(Strings.incorrectCell)
        }
        
        guard let bank = bankList?[indexPath.row] else {
            preconditionFailure(Strings.noBankInRow)
        }
        
        cell.bankNameLabel.text = bank.name
        cell.bankImageView.downloadBankImageWithCache(bank.img)
        return cell
        
    }
    
    func bank(at index : Int) -> Bank {
        return bankList[index]
    }
    
    

}
