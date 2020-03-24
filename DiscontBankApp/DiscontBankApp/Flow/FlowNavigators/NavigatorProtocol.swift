//
//  NavigatorProtocol.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 13/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

protocol FlowCoordinator {
    associatedtype Destination // for each Flow controller, we can have a different set of destinations we want to go to. (login could be to go thru the different steps; onboarding could show different app features)
        
    func start()//when each FC is instantiated, we 'start' it and in this function it will deside what to do/show (show the first login step)
       
    func navigate(to  destination : Destination)//when a action in a VC takes place, we will let the FC know by calling this
    
}

protocol HigherOrderFlowCoordinator {
    associatedtype Destination
    
    func didFinishFlow(for destination : Destination)//when a specific flow had finished (the last screen was shown), we need to let a higher order FC know about it. This is useful if the flow ends after a specific action (e.g. done button)
}
