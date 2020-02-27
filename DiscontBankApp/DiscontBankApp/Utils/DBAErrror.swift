//
//  DBAErrror.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

enum JsonError : Error { //conforms to error protocol
    case invalidJson(errorMessage : String)
}

enum NetworkError : Error {
    case invalidUrl(errorMessage : String)
    case netwokError(errorMessage : String)
    case invalidResponse(errorMessage : String)
    case invalidData
}

enum DataParseError : Error {
    case invalidData(errorMessage  :String)
}

enum FetchError : Error {
    case invalid
}


