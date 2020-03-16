//
//  NavigatorProtocol.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 13/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

protocol Navigator {
    associatedtype Destination
    
    func navigate(to destination : Destination)
}
