//
//  AppDelegate.swift
//  Unsplash-feed
//
//  Created by Andrey Sergeev on 23.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = UFReactiveFrameworkSelectionViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
