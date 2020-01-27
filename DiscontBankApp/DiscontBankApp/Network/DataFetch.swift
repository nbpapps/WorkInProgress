//
//  DataFetch.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 27/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct DataFetch {
    func fetchBankImage(foUrlString : String, completion : @escaping(Result<Data,NetworkError>) -> Void) {
        guard let url = URL(string: foUrlString) else {
            completion(.failure(.invalidUrl(errorMessage: "The input was \(foUrlString)")))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let networkError = error {
                //we have an error in the network call
                completion(.failure(.netwokError(errorMessage: "The network error was \(networkError)")))
            }
            
            guard let networkResponse = response as? HTTPURLResponse, networkResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse(errorMessage: "the response was \(String(describing: response))")))
                return
            }
            
            guard let receivedData = data else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(receivedData))
        }
        
        task.resume()
    
       }
}
