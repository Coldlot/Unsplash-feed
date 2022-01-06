//
//  UFDIAssembleService.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import Swinject

protocol UFDIAssembleService: AnyObject {
    var container: Container { get }
    func resolve<T>(_ service: T) -> T?
}
