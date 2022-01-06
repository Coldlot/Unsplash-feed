//
//  UFUserDefaultsService.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import Foundation

protocol UFUserDefaultsService: AnyObject {
    var storedLanguage: UFLanguage { get }
    var storedTheme: UFTheme { get }
}
