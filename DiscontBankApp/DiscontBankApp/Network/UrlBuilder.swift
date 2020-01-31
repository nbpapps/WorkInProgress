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
        
        guard let url = comps.url else {
             preconditionFailure(Strings.urlInvalid)
        }
        return url
    }
}
