//
//  ThemedViewController.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import UIKit

protocol ThemedViewController where Self: UIViewController {
    var backgroundColor: UnsplashFeedColors { get }
    var textColor: UnsplashFeedColors { get }
}
