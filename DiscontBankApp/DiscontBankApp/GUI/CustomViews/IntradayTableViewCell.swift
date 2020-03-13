//
//  IntradayTableViewCell.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class IntradayTableViewCell: UITableViewCell {
    
    static let reuseId = "IntraDayCell"
    
    let timeView = IntradayItemInfoView(frame: .zero)
    let openView = IntradayItemInfoView(frame: .zero)
    let highView = IntradayItemInfoView(frame: .zero)
    let lowView = IntradayItemInfoView(frame: .zero)
    let closeView = IntradayItemInfoView(frame: .zero)
    let volumeView = IntradayItemInfoView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configue()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Strings.noStoryboardImplementation)
    }
    
    private func configue() {
        let mainStackView = UIStackView(arrangedSubviews: [timeView,openView,highView,lowView,closeView,volumeView])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UITableViewCell.cellPadding),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UITableViewCell.cellPadding),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UITableViewCell.cellPadding),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UITableViewCell.cellPadding)
        ])
    }
}
