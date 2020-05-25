//
//  BanksListViewModel.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 01/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

#warning("I changed the class to be a VM instead of DataSource")
final class BanksListViewModel : NSObject, UICollectionViewDataSource {
    
    private var bankList : [Bank]?
    private let imageLoader = ImageLoader()

    func bank(at index : Int) -> Bank? {
        guard let bank = bankList?[index] else {
            return nil
        }
        return bank
    }
    
}

//This is for extracting the banks from the JSON

extension BanksListViewModel {
    static let bankListEndPointJson = "banks.json"
    
    typealias fetchCompletion = () -> Void
    
    func extractBankList(from data : Data,with completion : @escaping fetchCompletion) {
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
            
            completion()
            
        case .failure(let error):
            print("extractBankList \(error)")
        }
    }
    
}

//This is for the collection view Data Source
extension BanksListViewModel {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bankList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BankCollectionViewCell.reuseId, for: indexPath) as? BankCollectionViewCell else {
            preconditionFailure(Strings.incorrectCell)
        }
        
        guard let bank = bankList?[indexPath.row] else {
            preconditionFailure(Strings.noItemInRow)
        }
        
        cell.bankNameLabel.text = bank.name

        if let url = URL(string: bank.img) {
            cell.bankImageView.loadImage(at : url)
        }
        
        return cell
    }
}
