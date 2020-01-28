//
//  UrlBuilder.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct UrlBuilder {
    private var host : String
    private var scheme : String
    private var path : String
    private var queryItmes : [URLQueryItem]
    
    
    init(scheme: String,host: String,path:String,queryItmes : [URLQueryItem] ) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.queryItmes = queryItmes
    }
    
    public func buildUrl() -> URL {
        var comps = URLComponents()
        comps.scheme = self.scheme
        comps.host = self.host
        comps.path = self.path
        comps.queryItems = self.queryItmes
        
        return comps.url! //we return unwraped b/c if this is not a URL, we need to look at the values we passed it, and we can't continue with getting data from the network
        
    }
}
