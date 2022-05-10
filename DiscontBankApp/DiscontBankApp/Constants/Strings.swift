//
//  Strings.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct Strings {
    
    //MARK:- network
    
    static let defualtInterval = "1min"
    
    
    
    //MARK:- titles
    static let selectBankTitle = NSLocalizedString("Select Bank", comment: "title for the bank selection screen")
    static let mainScreen = NSLocalizedString("Main screen", comment: "title for the main selection screen")
    
    
    //MARK:- errors
    static let noStoryboardImplementation = "Storyboard not implemented"
    static let incorrectCell = "Incorrect cell setup for collection view"
    static let noItemInRow = "No itme for this row"
    static let dataInvalid = "the data is invalide"
    static let urlInvalid = "URL is invalid"
    
    
    //MARK:- intra day titles
    static let timeTitle = NSLocalizedString("time", comment: "title for intraday time")
    static let openTitle = NSLocalizedString("open", comment: "title for intraday open")
    static let highTitle = NSLocalizedString("high", comment: "title for intraday high")
    static let lowTitle = NSLocalizedString("low", comment: "title for intraday low")
    static let closeTitle = NSLocalizedString("close", comment: "title for intraday close")
    static let volumeTitle = NSLocalizedString("volume", comment: "title for intraday volume")
    
}
