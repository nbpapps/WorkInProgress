//
//  IntradayLogicController.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

enum IntradayState {
    case loading
    case presenting //here we can add any data we want to pass the VC
    case failed(Error?)
}

class IntradayLogicController {
    typealias CompletionHandler = (IntradayState) -> Void
    
    //MARK: - API for the Intraday Logic
    func loadBankStk(bankStk : String, andTimeInterval timeInterval : String,fromDataSource timeSeriesDataSource : TimeSeriesDataSource, with completionHandler : @escaping CompletionHandler) {
        
        //load the intraday info
        timeSeriesDataSource.fetchIntradayData(for: bankStk, and: timeInterval) { (error, success) in
            DispatchQueue.main.async {
                if let intradayError = error {
                    completionHandler(.failed(intradayError))
                }else{
                    if success {
                        completionHandler(.presenting)
                    }else{
                        completionHandler(.failed(nil))
                    }
                }
            }
        }
    }
}
