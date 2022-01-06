//
//  UFDIAssembleManager.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import Swinject

final class UFDIAssembleManager: UFDIAssembleService {
    var container: Container
    
    init() {
        container = Container()
        registerServices()
    }
    
    func resolve<T>(_ service: T) -> T? {
        container.resolve(T.self)
    }
    
    private func registerServices() {
        registerStorageServices()
        registerAppearenceServices()
        registerNetworkServices()
    }
}

extension UFDIAssembleManager {
    private func registerStorageServices() {
        container.register(UFUserDefaultsService.self) { _ in
            UFUserDefaultsManager()
        }
    }
    
    private func registerAppearenceServices() {
        container.register(UFLanguageService.self) { r in
            UFLanguageManager(language: r.resolve(UFUserDefaultsService.self)!.storedLanguage)
        }
        
        container.register(UFThemeService.self) { r in
            UFThemeManager(theme: r.resolve(UFUserDefaultsService.self)!.storedTheme)
        }
    }
    
    private func registerNetworkServices() {
        
    }
}
