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
    
    public func decode(with timeInterval : String) -> Result<[TimeSeriesValues],DataParseError>{
        var timeSeriesArray = [TimeSeriesValues]()
        do {
            if let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] , let timeSeries = dict["Time Series ("+timeInterval+")"] as? [String:Any] {
                for (key,value) in timeSeries {
                    if let ohlcv = value as? [String:String] {
                        let time = key
                        if let open = ohlcv["1. open"], let high = ohlcv["2. high"], let low = ohlcv["3. low"],
                            let close = ohlcv["4. close"], let volume = ohlcv["5. volume"] {
                            let tsv = TimeSeriesValues(open: open, high: high, low: low, close: close, volume: volume, time: time)
                            timeSeriesArray.append(tsv)
                        }
                    }
                }
            }
            timeSeriesArray.sort { (lhs, rhs) -> Bool in
                return lhs.time > rhs.time
            }
            if !timeSeriesArray.isEmpty {
                return .success(timeSeriesArray)
            }else{
                print("no dictionary for Time Series")
                return .failure(.invalidData(errorMessage:""))
            }
        }
        catch {
            print("decode \(error.localizedDescription)")
            return .failure(.invalidData(errorMessage: error.localizedDescription))
        }
    }
    
    
    
    
}
