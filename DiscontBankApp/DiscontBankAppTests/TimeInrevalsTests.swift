//
//  TimeInrevalsTests.swift
//  DiscontBankAppTests
//
//  Created by niv ben-porath on 01/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import XCTest

class TimeInrevalsTests: XCTestCase {

    func testIntervalAtIndex() {
        let timeIntervals = TimeIntervals()
        let intervalAtIndex1 = timeIntervals.getInterval(at: 1)
        XCTAssertEqual(intervalAtIndex1, "5min", "interval at index 1 is not 5 min")
    }
    
    func testAllIntrvals() {
        let allIntervals = TimeIntervals().getAllIntervalOptions() //["1min", "5min", "15min", "30min", "60min"]
        XCTAssertEqual(allIntervals, ["1min", "5min", "15min", "30min", "60min"], "all intervals are not correct")
    }
    
    func testDefaultInterval() {
        let intervals = TimeIntervals()
        let defaulfInterval = intervals.getDefualtInterval()
        XCTAssertEqual(defaulfInterval, "1min", "default interval is not correct")
    
    }
}
