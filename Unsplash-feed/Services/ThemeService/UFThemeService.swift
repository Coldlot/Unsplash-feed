//
//  UFThemeService.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import Foundation
import RxSwift

protocol UFThemeService: AnyObject {
    var themeObservable: Observable<UFTheme> { get }
    var currentTheme: UFTheme { get }
    func updateTheme(with theme: UFTheme)
}
