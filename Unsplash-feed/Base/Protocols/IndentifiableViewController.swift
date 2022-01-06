//
//  IndentifableViewController.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 06.01.2022.
//

import UIKit

protocol IndentifiableViewController where Self: UIViewController {
    var id: String { get }
}
