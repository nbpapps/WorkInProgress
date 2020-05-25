//
//  DataFetch.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

typealias networkCompletion =  (Result<Data,NetworkError>) -> Void

struct DataFetch {
    
    func fetchTimeSeriesIntraday(for symbol : String,and timeInterval : String, with completion : @escaping networkCompletion) {
        let queryItmes : [URLQueryItem] = [
            URLQueryItem(name: UrlBuilder.apiKey, value: UrlBuilder.apiValue),
            URLQueryItem(name: UrlBuilder.functionKey, value: UrlBuilder.functionValue),
            URLQueryItem(name: UrlBuilder.symbolKey, value: symbol),
            URLQueryItem(name: UrlBuilder.intervalKey, value: timeInterval)
        ]
        
        let timeSeriesIntradayUrl = UrlBuilder(queryItmes: queryItmes).buildUrlForTimeSeriesIntraday()
        let networkService = NetworkService()
        networkService.makeNetworkCall(for: timeSeriesIntradayUrl) { (result) in
            completion(result)
        }
    }
}
