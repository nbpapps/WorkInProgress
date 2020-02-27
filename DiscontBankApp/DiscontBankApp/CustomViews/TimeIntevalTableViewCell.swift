//
//  TimeIntevalTableViewCell.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 29/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class TimeIntevalTableViewCell: UITableViewCell {
    
    let timeIntervalLabel = DBALabel(textAlignment: .center, fontSize: UILabel.timeIntervalLabelFontSize, weight: .regular)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Strings.noStoryboardImplementation)
    }
    
    private func configure() {
        timeIntervalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeIntervalLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UITableViewCell.cellPadding),
            timeIntervalLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UITableViewCell.cellPadding),
            timeIntervalLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UITableViewCell.cellPadding),
            timeIntervalLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UITableViewCell.cellPadding)
        ])
    }
}
