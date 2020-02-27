//
//  IntradayItemInfoView.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/02/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

class IntradayItemInfoView: UIView {
    
    let itemTitleLabel = DBALabel(textAlignment: .left, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular, color: .systemBlue)
    let itemValueLabel = DBALabel(textAlignment: .right, fontSize: UILabel.timeSeriesLabelFontSize, weight: .regular,color: .systemBlue)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    init(title : String,value: String,textColor : UIColor) {
        super.init(frame: .zero)
        itemTitleLabel.text = title
        itemValueLabel.text = value
        
        itemTitleLabel.textColor = textColor
        itemValueLabel.textColor = textColor
        
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.noStoryboardImplementation)
    }
    
    private func config() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
