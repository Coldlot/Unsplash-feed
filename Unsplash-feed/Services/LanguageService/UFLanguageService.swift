//
//  UFLanguageService.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import Foundation
import RxSwift

protocol UFLanguageService: AnyObject {
    var languageObservable: Observable<UFLanguage> { get }
    var currentLanguage: UFLanguage { get }
    func updateLanguage(with language: UFLanguage)
}
