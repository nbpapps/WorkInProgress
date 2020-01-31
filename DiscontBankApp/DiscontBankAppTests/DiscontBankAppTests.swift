//
//  DiscontBankAppTests.swift
//  DiscontBankAppTests
//
//  Created by niv ben-porath on 26/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import XCTest
@testable import DiscontBankApp

class DiscontBankAppTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testJsonParser() {
        let bankJsonString = """
                        { "name":"First Intl", "stk":"FINT","img":"http://fint.com/pic","priority":"111"}
                        """
        let bankJsonData = Data(bankJsonString.utf8)
        let jsonParser = JsonParser(data: bankJsonData)
        let banks : Result<Bank,JsonError> = jsonParser.decode()
        let bankList = try! banks.get()
        XCTAssertEqual(bankList.name, "First Intl", "bank name is incorrect")
        XCTAssertEqual(bankList.stk, "FINT", "bank stk is incorrect")
        XCTAssertEqual(bankList.img, "http://fint.com/pic", "bank image is incorrect")
        XCTAssertEqual(bankList.priority, "111", "bank priority is incorrect")
    }
    
    func testBankAtIndex() {
        let bankJsonString = """
                               [{ "name":"First Intl", "stk":"FINT","img":"http://fint.com/pic","priority":"111"}]
                               """
        let bankJsonData = Data(bankJsonString.utf8)
        let bankDataSource = BankListDataSource()
        let testExpectation = expectation(description: "Expected bank to be fetched")

        bankDataSource.extractBankList(from: bankJsonData) {
            let bank = bankDataSource.bank(at: 0)
            XCTAssertEqual(bank!.name, "First Intl", "bank name is incorrect")
            XCTAssertEqual(bank!.stk, "FINT", "bank stk is incorrect")
            XCTAssertEqual(bank!.img, "http://fint.com/pic", "bank image is incorrect")
            XCTAssertEqual(bank!.priority, "111", "bank priority is incorrect")
            
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}
