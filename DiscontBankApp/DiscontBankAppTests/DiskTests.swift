//
//  DiskTests.swift
//  DiscontBankAppTests
//
//  Created by niv ben-porath on 02/02/2023.
//  Copyright © 2023 nbpApps. All rights reserved.
//

import XCTest
@testable import DiscontBankApp


class DiskStoreTest: XCTestCase {

    let disk = DiskStore.shared

    override func setUpWithError() throws {
        deleteDiskData(during: "set up")
    }

    override func tearDownWithError() throws {
        deleteDiskData(during: "tear down")
    }
    
    private func deleteDiskData(during step: String) {
        do {
            try disk.deleteData(from: .memoryData)
        }
        catch {
            XCTFail("could not delete data from disk during \(step))")
        }
    }
    
    func testDiskStore_writeFullMemoryDataInfo_shouldFetchAllItems() {
        
        //given
        let dateTodoText = "Take a walk"
        
        let listTodoText = "Jagged Little Pill"
        let listName = "Alanis Morissette"
        let listSetName = "Music"
        let todoDate = "2023-01-25"
        let email = "ironic@The.Collection"
        
        let listTodoID: Int64 = 1
        let dateTodoID: Int64 = 2
        let listID: Int64 = 3
        let workspaceID: Int64 = 4
        let listSetID: Int64 = 5
        let userID: Int64 = 6
        
        let strings = [dateTodoText, listTodoText, listName, listSetName, todoDate, email]
        let ints = [dateTodoID, listID, userID, workspaceID, listSetID, listTodoID]
        
        let memoryData = MemoryData(strings: strings, ints: ints)
        
        //when
        disk.saveWithWorkItem(memoryData, to: .memoryData)
        let stringCount = strings.count
        let intCount = ints.count
        
        //then
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            if let readData: MemoryData = self.disk.fetch(from: .memoryData) {
                let readStrings = readData.strings
                let readInts = readData.ints
                
                XCTAssertEqual(readStrings.count, stringCount)
                XCTAssertEqual(readInts.count, intCount)
                
                XCTAssertEqual(readStrings[0], dateTodoText)
                XCTAssertEqual(readInts[0], dateTodoID)
            }
            else {
                XCTFail( "could not read data from disk")
            }
        }
    }
}
