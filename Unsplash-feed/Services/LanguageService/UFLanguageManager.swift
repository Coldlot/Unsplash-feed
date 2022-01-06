//
//  UFLanguageManager.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import RxRelay
import RxSwift

final class UFLanguageManager: UFLanguageService {
    init(language: UFLanguage) {
        languageRelay = BehaviorRelay(value: language)
    }
    
    var languageObservable: Observable<UFLanguage> {
        languageRelay.asObservable()
    }
    
    var currentLanguage: UFLanguage {
        languageRelay.value
    }
    
    func updateLanguage(with language: UFLanguage) {
        languageRelay.accept(language)
    }
    
    private let languageRelay: BehaviorRelay<UFLanguage>
}
