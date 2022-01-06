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
    var diAssembleService = UFDIAssembleManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = UFReactiveFrameworkSelectionViewController(viewModel: UFReactiveFrameworkSelectionViewModel())
        window?.makeKeyAndVisible()
        return true
    }
}
