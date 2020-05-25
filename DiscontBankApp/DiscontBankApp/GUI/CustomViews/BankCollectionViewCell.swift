//
//  BankTableViewCell.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class BankCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "BankCell"
    
    let bankImageView = DBAImageView(frame: .zero)
    let bankNameLabel = DBALabel(textAlignment: .center, fontSize: UILabel.bankNameLabelFontSize, weight: .bold)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.noStoryboardImplementation)
    }
    
    private func configure() {
        bankImageView.backgroundColor = .white
        addSubview(bankImageView)
        addSubview(bankNameLabel)
        contentView.layer.cornerRadius = UICollectionViewCell.cellRadius
        contentView.backgroundColor = .mainColor
        NSLayoutConstraint.activate([
            
            bankImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UICollectionViewCell.cellPadding),
            bankImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UICollectionViewCell.cellPadding),
            bankImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UICollectionViewCell.cellPadding),
            bankImageView.heightAnchor.constraint(equalTo: bankImageView.widthAnchor),
            
            
            bankNameLabel.topAnchor.constraint(equalTo: bankImageView.bottomAnchor, constant: UICollectionViewCell.cellPadding),
            bankNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UICollectionViewCell.cellPadding),
            bankNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UICollectionViewCell.cellPadding),
            bankNameLabel.heightAnchor.constraint(equalToConstant: UILabel.labelheight)
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bankImageView.cancelImageLoad()
        bankImageView.image = nil
    }
    
}
