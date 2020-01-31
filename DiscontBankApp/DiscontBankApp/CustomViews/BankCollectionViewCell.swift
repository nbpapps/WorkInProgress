//
//  BankTableViewCell.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class BankCollectionViewCell: UICollectionViewCell {

    static let reuseId = Strings.bankCell
    
    let bankImageView = DBAImageView(frame: .zero)
    let bankNameLabel = DBALabel(textAlignment: .center, fontSize: Values.bankNameFontSize, weight: .bold)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
       
    required init?(coder: NSCoder) {
        fatalError(Strings.noStoryboradImplementation)
    }
    
    private func configure() {
        bankImageView.backgroundColor = .white
        addSubview(bankImageView)
        addSubview(bankNameLabel)
        contentView.layer.cornerRadius = Values.cellRadius
        contentView.backgroundColor = UIColor(named: Strings.appMainColor)
        NSLayoutConstraint.activate([
            
            bankImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Values.cellPadding),
            bankImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Values.cellPadding),
            bankImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Values.cellPadding),
            bankImageView.heightAnchor.constraint(equalTo: bankImageView.widthAnchor),

            
            bankNameLabel.topAnchor.constraint(equalTo: bankImageView.bottomAnchor, constant: Values.cellPadding),
            bankNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Values.cellPadding),
            bankNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Values.cellPadding),
            bankNameLabel.heightAnchor.constraint(equalToConstant: Values.labelheight)
        
        ])
    }
}
