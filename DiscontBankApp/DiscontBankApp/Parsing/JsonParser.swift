//
//  JsonParser.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation


public struct JsonParser {
    
    private var data : Data
    private var decoder : JSONDecoder

    init(data : Data,decoder : JSONDecoder = JSONDecoder()) {
        self.data = data
        self.decoder = decoder
    }
    
    public func decode<T : Decodable>() -> Result<T,JsonError>{
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let decodedObject = try decoder.decode(T.self, from: data)
            return .success(decodedObject)
        }
        catch {
            print("decoce invalide json")
            return .failure(.invalidJson(errorMessage: error.localizedDescription))
        }
    }
    
}
