//
//  UrlBuilder.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct UrlBuilder {
    private var queryItmes : [URLQueryItem]
    
    #warning("Is this more of what you had in mind for the URL builder? I wanted the query items to be in the 'DataFetch' class as they get chnaged for each request. I split the params to scheme and host, so that I get the URL 'built' by the url method on URLComponents ")
    
    
    //https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=JPM&interval=1min&apikey=Z8EW6CI3PHR9SUTK
    private static let scheme = "https"
    private static let baseHost = "www.alphavantage.co"
    private static let queryPath = "/query"
    
    static let apiKey = "apikey"
    static let apiValue = "4YK7EU2STGWQ2SFK"
    static let functionKey = "function"
    static let functionValue = "TIME_SERIES_INTRADAY"
    static let symbolKey = "symbol"
    static let intervalKey = "interval"
    
    init(queryItmes : [URLQueryItem]) {
        self.queryItmes = queryItmes
    }
    
    func buildUrlForTimeSeriesIntraday() -> URL {
        var comps = URLComponents()
        comps.scheme = UrlBuilder.scheme
        comps.host = UrlBuilder.baseHost
        comps.path = UrlBuilder.queryPath
        comps.queryItems = self.queryItmes
        
        guard let url = comps.url else {
            preconditionFailure(Strings.urlInvalid)
        }
        return url
    }
}
