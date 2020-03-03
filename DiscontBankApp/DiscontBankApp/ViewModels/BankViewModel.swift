//
//  BankViewModel.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 01/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation
#warning("I added this VM")
struct BankViewModel {
    private var bank : Bank
    
    init(bank : Bank) {
        self.bank = bank
    }
    
    var bankName : String {
        return bank.name
    }
    
    var bankStk : String {
        return bank.stk
    }
}
