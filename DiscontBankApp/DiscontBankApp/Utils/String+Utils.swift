//
//  String+Utils.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 29/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

extension String {
    func extractTimeFromDate() -> String {
        let dateTimeArray = self.split(separator: " ")
        if dateTimeArray.count == 2 {
            let time = dateTimeArray[1]
            return String(time)
        }else{
            return self
        }
    }
}
