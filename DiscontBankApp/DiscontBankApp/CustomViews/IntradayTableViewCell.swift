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
    
    let timeTitleLabel = DBALabel(textAlignment: .left, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular, color: .systemBlue)
    let timeValueLabel = DBALabel(textAlignment: .right, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemBlue)
    
    let openTitleLabel = DBALabel(textAlignment: .left, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color:.systemOrange)
    let openValueLabel = DBALabel(textAlignment: .right, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemOrange)
    
    let highTitleLabel = DBALabel(textAlignment: .left, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemGreen)
    let highValueLabel = DBALabel(textAlignment: .right, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemGreen)
    
    let lowTitleLabel = DBALabel(textAlignment: .left, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemRed)
    let lowValueLabel = DBALabel(textAlignment: .right, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemRed)
    
    let closeTitleLabel = DBALabel(textAlignment: .left, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemPurple)
    let closeValueLabel = DBALabel(textAlignment: .right, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemPurple)
    
    let volumeTitleLabel = DBALabel(textAlignment: .left, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemIndigo)
    let volumeValueLabel = DBALabel(textAlignment: .right, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemIndigo)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configue()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Strings.noStoryboardImplementation)
    }
    
    private func configue() {
        timeTitleLabel.text = Strings.timeTitle
        openTitleLabel.text = Strings.openTitle
        highTitleLabel.text = Strings.highTitle
        lowTitleLabel.text = Strings.lowTitle
        closeTitleLabel.text = Strings.closeTitle
        volumeTitleLabel.text = Strings.volumeTitle
        
        let titleStackView = UIStackView(arrangedSubviews: [timeTitleLabel,openTitleLabel,highTitleLabel,lowTitleLabel,closeTitleLabel,volumeTitleLabel])
        titleStackView.axis = .vertical
        titleStackView.distribution = .fill
        
        let valueStackView = UIStackView(arrangedSubviews: [timeValueLabel,openValueLabel,highValueLabel,lowValueLabel,closeValueLabel,volumeValueLabel])
        valueStackView.axis = .vertical
        valueStackView.distribution = .fill
        
        let mainStackView = UIStackView(arrangedSubviews: [titleStackView,valueStackView])
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillProportionally
        
        contentView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UITableViewCell.cellPadding),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UITableViewCell.cellPadding),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UITableViewCell.cellPadding),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UITableViewCell.cellPadding)
        ])
    }
}
