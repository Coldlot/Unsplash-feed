//
//  UserDefaultsWrapper.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import Foundation

@propertyWrapper
struct Defaults<T> {
    private let key: UFUserDefaultsKeys
    private let defaultValue: T
    
    init(key: UFUserDefaultsKeys, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key.rawValue) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key.rawValue)
        }
    }
}
