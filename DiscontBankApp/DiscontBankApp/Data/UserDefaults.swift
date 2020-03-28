//
//  UserDefaults.swift
//  DiscontBankApp
//
//  Created by niv ben-porath on 21/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultsConfig {
    @UserDefault("hasSeenOnboarding", defaultValue: false)
    static var hasSeenOnboarding: Bool
    
    
    
    
}


//extension UserDefaults {
//    public enum Keys {
//        static let onboardingWasShown = "onboardingWasShown"
//    }
//
//    var onboardingWasShown : Bool {
//        set {
//            set(newValue,forKey: Keys.onboardingWasShown)
//        }
//        get{
//            return bool(forKey: Keys.onboardingWasShown)
//        }
//    }
//}
