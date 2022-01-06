//
//  UFUserDefaultsManager.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

final class UFUserDefaultsManager: UFUserDefaultsService {
    @Defaults(key: .languageKey, defaultValue: UFLanguage.en)
    var storedLanguage: UFLanguage
    
    @Defaults(key: .themeKey, defaultValue: UFTheme.light)
    var storedTheme: UFTheme
    
    init(){}
}
