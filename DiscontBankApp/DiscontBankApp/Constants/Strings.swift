//
//  Strings.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

public struct Strings {
    static let shared = Strings()
    
    //MARK: - end points
    let banksJson = "banks.json"
    
    //MARK:- titles
    let selectBankTitle = "Select Bank"
    
    //MARK:- general
    let placeholder = "placeholder"
    
    //MARK:- colors
    let appMainColor = "MainColor"
    
    //MARK:- identifiers
    let bankCell = "BankCell"
    
    //MARK:- errors
    let noStoryboradImplementation = "Storyboard not implemented"
    let incorrectCell = "Incorrect cell setup for collection view"
    let noBankInRow = "No bank for this row"
    let dataInvalid = "the data is invalide"
    
}
