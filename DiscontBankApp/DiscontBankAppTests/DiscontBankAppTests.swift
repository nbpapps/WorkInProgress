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
        let bankDataSource = BanksListViewModel()
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
    
    func testNetwork_insertInvalidDataFailure_shouldResultInAFailure() {
        var finalResult: (Result<Data,NetworkError>)?
        let result: (Result<Data,NetworkError>) = .failure(.invalidData)
        let nsm = NetworkServiceMock(result: result)
        let df = DataFetch(networkService: nsm)
        let expectation = self.expectation(description: "net")
        df.fetchTimeSeriesIntraday(for: "", and: "") { r in
            finalResult = r
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        switch finalResult {
        case .success:
            XCTFail()
        case .failure(let failure):
            XCTAssertEqual(failure.localizedDescription, NetworkError.invalidData.localizedDescription)
        case nil:
            XCTFail()
        }
    }
    
    func testNetwork_insertInvalidResponseFailure_shouldResultInAFailure() {
        var finalResult: (Result<Data,NetworkError>)?
        let result: (Result<Data,NetworkError>) = .failure(.invalidResponse(errorMessage: "invalidResponse"))
        let nsm = NetworkServiceMock(result: result)
        let df = DataFetch(networkService: nsm)
        let expectation = self.expectation(description: "net")
        df.fetchTimeSeriesIntraday(for: "", and: "") { r in
            finalResult = r
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        switch finalResult {
        case .success:
            XCTFail()
        case .failure(let failure):
            XCTAssertEqual(failure.localizedDescription, NetworkError.invalidResponse(errorMessage: "invalidResponse").localizedDescription)
        case nil:
            XCTFail()
        }
    }
    
    func testNetwork_insertInvalidURLFailure_shouldResultInAFailure() {
        var finalResult: (Result<Data,NetworkError>)?
        let result: (Result<Data,NetworkError>) = .failure(.invalidUrl(errorMessage: "invalidURL"))
        let nsm = NetworkServiceMock(result: result)
        let df = DataFetch(networkService: nsm)
        let expectation = self.expectation(description: "net")
        df.fetchTimeSeriesIntraday(for: "", and: "") { r in
            finalResult = r
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        switch finalResult {
        case .success:
            XCTFail()
        case .failure(let failure):
            XCTAssertEqual(failure.localizedDescription, NetworkError.invalidUrl(errorMessage: "invalidURL").localizedDescription)
        case nil:
            XCTFail()
        }
    }
    
    func testNetwork_insertNetworkErrorFailure_shouldResultInAFailure() {
        var finalResult: (Result<Data,NetworkError>)?
        let result: (Result<Data,NetworkError>) = .failure(.netwokError(errorMessage: "error"))
        let nsm = NetworkServiceMock(result: result)
        let df = DataFetch(networkService: nsm)
        let expectation = self.expectation(description: "net")
        df.fetchTimeSeriesIntraday(for: "", and: "") { r in
            finalResult = r
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        switch finalResult {
        case .success:
            XCTFail()
        case .failure(let failure):
            XCTAssertEqual(failure.localizedDescription, NetworkError.netwokError(errorMessage: "error").localizedDescription)
        case nil:
            XCTFail()
        }
    }
    
    func testNetwork_insertData_shouldResultTheData() {
        var finalResult: (Result<Data,NetworkError>)?
        let string = "someString"
        let initialData: Data = Data(string.utf8)
        let result: (Result<Data,NetworkError>) = .success(initialData)
        let nsm = NetworkServiceMock(result: result)
        let df = DataFetch(networkService: nsm)
        let expectation = self.expectation(description: "net")
        df.fetchTimeSeriesIntraday(for: "", and: "") { r in
            finalResult = r
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        switch finalResult {
        case .success(let data):
            XCTAssertEqual(String(decoding: data, as: UTF8.self), string)
        case .failure:
            XCTFail()
           
        case nil:
            XCTFail()
        }
    }
}
