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
    public func fetchBankImage(foUrlString : String, with completion : @escaping networkCompletion) {
        guard let url = URL(string: foUrlString) else {
            print("fail fetchBankImage")
            completion(.failure(.invalidUrl(errorMessage: "The input was \(foUrlString)")))
            return
        }
        
        let networkService = NetworkService()
        networkService.makeNetworkCall(for: url) { (result) in
            completion(result)
        }
    }
    
    public func fetchTimeSeriesIntraday(for symbol : String,and timeInterval : String, with completion : @escaping networkCompletion) {
        let queryItmes : [URLQueryItem] = [
            URLQueryItem(name: Strings.apiKey, value: Strings.apiValue),
            URLQueryItem(name: Strings.functionKey, value: Strings.functionValue),
            URLQueryItem(name: Strings.symbolKey, value: symbol),
            URLQueryItem(name: Strings.intervalKey, value: timeInterval)
        ]
        
        let timeSeriesIntradayUrl = UrlBuilder(scheme: Strings.scheme, host: Strings.baseHost, path: Strings.path, queryItmes: queryItmes).buildUrl()
        
        let networkService = NetworkService()
        networkService.makeNetworkCall(for: timeSeriesIntradayUrl) { (result) in
            completion(result)
        }
    }
}
