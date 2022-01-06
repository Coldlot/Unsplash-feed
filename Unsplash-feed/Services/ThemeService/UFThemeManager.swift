//
//  UFThemeManager.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import RxSwift
import RxRelay

final class UFThemeManager: UFThemeService {
    init(theme: UFTheme) {
        themeRelay = BehaviorRelay(value: theme)
    }
    
    var themeObservable: Observable<UFTheme> {
        themeRelay.asObservable()
    }
    
    var currentTheme: UFTheme {
        themeRelay.value
    }
    
    func updateTheme(with theme: UFTheme) {
        themeRelay.accept(theme)
    }
    
    private let themeRelay: BehaviorRelay<UFTheme>
}
