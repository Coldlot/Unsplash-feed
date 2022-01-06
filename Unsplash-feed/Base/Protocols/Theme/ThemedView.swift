//
//  ThemedView.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import UIKit

protocol ThemedView where Self: UIView {
    var backgroundViewColor: UnsplashFeedColors { get }
    var textColor: UnsplashFeedColors { get }
}
