//
//  Strings.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

public struct Strings {
    
    //MARK:- network
    //https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=JPM&interval=1min&apikey=Z8EW6CI3PHR9SUTK
    static let scheme = "https"
      
    static let baseHost = "www.alphavantage.co"
    static let path = "/query"
    
    static let apiKey = "apikey"
    static let apiValue = "4YK7EU2STGWQ2SFK"
    static let functionKey = "function"
    static let functionValue = "TIME_SERIES_INTRADAY"
    static let symbolKey = "symbol"
    static let intervalKey = "interval"
    static let defualtInterval = "1min"
    
    //MARK: - end points
   static let banksJson = "banks.json"
    
    //MARK:- titles
   static let selectBankTitle = "Select Bank"
   
    //MARK:- general
   static let placeholder = "placeholder"
   
    //MARK:- colors
   static let appMainColor = "MainColor"
   
    //MARK:- identifiers
   static let bankCell = "BankCell"
   static let intraDayCell = "intraDayCell"
   
    //MARK:- errors
   static let noStoryboradImplementation = "Storyboard not implemented"
   static let incorrectCell = "Incorrect cell setup for collection view"
   static let noItemInRow = "No itme for this row"
   static let dataInvalid = "the data is invalide"
   static let urlInvalid = "URL is invalid"
    
}
