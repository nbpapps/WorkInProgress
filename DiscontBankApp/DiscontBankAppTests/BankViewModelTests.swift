//
//  BankViewModelTests.swift
//  DiscontBankAppTests
//
//  Created by niv ben-porath on 01/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import XCTest
@testable import DiscontBankApp


class BankViewModelTests: XCTestCase {
    
    func testBankNameAndStk() {
        let bank = Bank(name: "myBank", stk: "MB", img: "http://nbpapps.com/myBankImage", priority: "123")
        let bankViewModel = BankViewModel(bank: bank)
        
        XCTAssertEqual(bankViewModel.bankName, "myBank", "bank name in incorrect")
        XCTAssertEqual(bankViewModel.bankStk, "MB", "bank stk is incorrect")
    }
}
