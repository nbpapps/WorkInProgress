//
//  DBAErrror.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

public enum JsonError : String,Error { //conforms to error protocol

    case invalideData = "the data is invalide"

}

public enum NetworkError : Error {
    case invalidUrl(errorMessage : String)
    case netwokError(errorMessage : String)
    case invalidResponse(errorMessage : String)
    case invalidData
    
}


