//
//  NavigatorProtocol.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 13/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

protocol BankInfoNavigator {
    associatedtype BankInfoDestination
    
    func navigate(to destination : BankInfoDestination)
}
