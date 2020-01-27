//
//  Values.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit


struct Values {
    static let shared = Values()
    
    //MARK:- config
    let numberOfCollectionViewColums = 2
    
    //MARK:- Cells
    let cellPadding : CGFloat = 8
    let cellRadius : CGFloat = 15
    
    //MARK:- collection view
    let collectionViewPadding : CGFloat = 12
    let collectionViewMinItemSpacing : CGFloat = 10
    let collectionViewAdditionalItemHeight : CGFloat = 40
    
    //MARK:- labels
    let labelheight : CGFloat = 20

}
