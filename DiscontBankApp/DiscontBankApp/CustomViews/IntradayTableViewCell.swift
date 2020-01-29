//
//  IntradayTableViewCell.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class IntradayTableViewCell: UITableViewCell {

    static let reuseId = Strings.intraDayCell

    let timeTitleLabel = DBALabel(textAlignment: .left, fontSize: Values.timeSeriesLabelFontSize, weight: .regular, color: .systemBlue)
    let timeValueLabel = DBALabel(textAlignment: .right, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemBlue)

    let openTitleLabel = DBALabel(textAlignment: .left, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color:.systemOrange)
    let openValueLabel = DBALabel(textAlignment: .right, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemOrange)
    
    let highTitleLabel = DBALabel(textAlignment: .left, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemGreen)
    let highValueLabel = DBALabel(textAlignment: .right, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemGreen)

    let lowTitleLabel = DBALabel(textAlignment: .left, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemRed)
    let lowValueLabel = DBALabel(textAlignment: .right, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemRed)

    let closeTitleLabel = DBALabel(textAlignment: .left, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemPurple)
    let closeValueLabel = DBALabel(textAlignment: .right, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemPurple)

    let volumeTitleLabel = DBALabel(textAlignment: .left, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemIndigo)
    let volumeValueLabel = DBALabel(textAlignment: .right, fontSize: Values.timeSeriesLabelFontSize, weight: .regular,color: .systemIndigo)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configue()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Strings.noStoryboradImplementation)
    }
    
    private func configue() {
        timeTitleLabel.text = "time"
        openTitleLabel.text = "open"
        highTitleLabel.text = "high"
        lowTitleLabel.text = "low"
        closeTitleLabel.text = "close"
        volumeTitleLabel.text = "volume"
        
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
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Values.cellPadding),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Values.cellPadding),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Values.cellPadding),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Values.cellPadding)
        ])
        
    }

}
