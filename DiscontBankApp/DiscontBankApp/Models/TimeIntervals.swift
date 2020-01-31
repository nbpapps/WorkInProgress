//
//  TimeIntervals.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation



struct TimeIntervals {
    
    private var timeIntervals : [String] = ["1min", "5min", "15min", "30min", "60min"]
    
    public func getInterval(at index : Int) -> String{
        guard timeIntervals.count > index else {
            if timeIntervals.isEmpty {
                return Strings.defualtInterval
            }else{
                return timeIntervals.last!
            }
        }
        return timeIntervals[index]
    }
    
    public func getAllIntervalOptions() -> [String] {
        return timeIntervals
    }
}


