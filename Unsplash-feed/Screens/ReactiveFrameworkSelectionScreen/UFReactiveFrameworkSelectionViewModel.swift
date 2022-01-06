//
//  UFReactiveFrameworkSelectionViewModel.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 02.12.2021.
//

import RxSwift
import RxRelay
import RxCocoa
import Foundation

struct UFReactiveFrameworkSelectionViewModel: ViewModel {
    
    
    var version: String {
        let dictionary = Bundle.main.infoDictionary
        let version = dictionary?["CFBundleShortVersionString"] as? String ?? ""
        let build = dictionary?["CFBundleVersion"] as? String ?? ""
        return "\(version) (\(build))"
    }
}
