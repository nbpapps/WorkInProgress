//
//  DataParser.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct DataParser {
    private var data : Data

    init(data : Data,decoder : JSONDecoder = JSONDecoder()) {
        self.data = data
    }
    
    public func decode() { //}-> Result<T,JsonError>{
        do {
            if let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] , let timeSeries = dict["Time Series (1min)"] as? [String:Any] {
                for (key,value) in timeSeries {
                    if let ohlcv = value as? [String:String] {
                        let time = key
                        if let open = ohlcv["1. open"], let high = ohlcv["2. high"], let low = ohlcv["3. low"],
                            let close = ohlcv["4. close"], let volume = ohlcv["5. volume"] {
                            let tsv = TimeSerisValues(open: open, high: high, low: low, close: close, volume: volume, time: time)
                            print(tsv)
                        }
                    }
                }
            }
//            return .success(decodedObject)
        }
        catch {
//            return .failure(.invalideJson(errorMessage: error.localizedDescription))
        }
    }
    
    
    
    
}
