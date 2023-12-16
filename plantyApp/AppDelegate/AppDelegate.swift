//
//  AppDelegate.swift
//  plantyApp
//
//  Created by Can Özseven on 16.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        let viewController = PlantTabBarViewController()
        self.window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}
