//
//  NetworkService.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 28/01/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

struct NetworkService {
    public func makeNetworkCall(for url : URL,with completion : @escaping networkCompletion) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let networkError = error {
                //we have an error in the network call
                print("network error")
                completion(.failure(.netwokError(errorMessage: "The network error was \(networkError)")))
            }
            
            guard let networkResponse = response as? HTTPURLResponse, networkResponse.statusCode == 200 else {
                print("response error")
                completion(.failure(.invalidResponse(errorMessage: "the response was \(String(describing: response))")))
                return
            }
            
            guard let receivedData = data else {
                print("invalid data from network")
                completion(.failure(.invalidData))
                return
            }

            completion(.success(receivedData))
        }
        
        task.resume()
    }
}
