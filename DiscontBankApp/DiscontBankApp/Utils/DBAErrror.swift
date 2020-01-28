//
//  DBAErrror.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

public enum JsonError : Error { //conforms to error protocol
    case invalideJson(errorMessage : String)
}

public enum NetworkError : Error {
    case invalidUrl(errorMessage : String)
    case netwokError(errorMessage : String)
    case invalidResponse(errorMessage : String)
    case invalidData
    
}


