//
//  BankTableViewCell.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class BankCollectionViewCell: UICollectionViewCell {

    static let reuseId = Strings.shared.bankCell
    
    let bankImageView = DBAImageView(frame: .zero)
    let bankNameLabel = DBALabel(textAlignment: .center, fontSize: 16, weight: .bold)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
       
    required init?(coder: NSCoder) {
        fatalError(Strings.shared.noStoryboradImplementation)
    }
    
    

    private func configure() {
        addSubview(bankImageView)
        addSubview(bankNameLabel)
        contentView.layer.cornerRadius = Values.shared.cellRadius
        contentView.backgroundColor = UIColor(named: Strings.shared.appMainColor)
        NSLayoutConstraint.activate([
            
            bankImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Values.shared.cellPadding),
            bankImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Values.shared.cellPadding),
            bankImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Values.shared.cellPadding),
            bankImageView.heightAnchor.constraint(equalTo: bankImageView.widthAnchor),

            
            bankNameLabel.topAnchor.constraint(equalTo: bankImageView.bottomAnchor, constant: Values.shared.cellPadding),
            bankNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Values.shared.cellPadding),
            bankNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Values.shared.cellPadding),
            bankNameLabel.heightAnchor.constraint(equalToConstant: Values.shared.labelheight)
        
        ])
    }

}
