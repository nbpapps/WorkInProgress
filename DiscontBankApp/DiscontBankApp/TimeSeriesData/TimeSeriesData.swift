//
//  TimeSeriesData.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 29/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct TimeSeriesData {

    static var shared = TimeSeriesData()
    
    private var timeSeriesDictionary = [String:[TimeSeriesValues]]()

    public func isTimeSeriesInDictionary(for key :String) -> Bool {
        if (timeSeriesDictionary[key] != nil) {
            return true
        }else{
            return false
        }
    }
    
    public mutating func save(timeSeriesArray : [TimeSeriesValues],forKey key : String) {
        timeSeriesDictionary[key] = timeSeriesArray
    }
    
    public func timeSeriesArray(for key :String) -> [TimeSeriesValues]? {
        if isTimeSeriesInDictionary(for: key) {
            return timeSeriesDictionary[key]
        }else{
            return nil
        }
    }
    
}
