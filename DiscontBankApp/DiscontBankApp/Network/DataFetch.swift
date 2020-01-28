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
    func fetchBankImage(foUrlString : String, with completion : @escaping networkCompletion) {
        guard let url = URL(string: foUrlString) else {
            completion(.failure(.invalidUrl(errorMessage: "The input was \(foUrlString)")))
            return
        }
        
        let networkService = NetworkService()
        networkService.makeNetworkCall(for: url) { (result) in
            completion(result)
        }
    }
}
