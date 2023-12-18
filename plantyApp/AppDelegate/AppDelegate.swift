//
//  AppDelegate.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let bounds = UIScreen.main.bounds
        self.window = UIWindow(frame: bounds)
        let alreadySeen = UserDefaults.standard.bool(forKey: "Seen")
        if alreadySeen {
            let plantTabBarViewController = PlantTabBarViewController()
            plantTabBarViewController.modalPresentationStyle = .fullScreen
            self.window?.rootViewController = plantTabBarViewController
        } else {
            let viewController = OnboardingViewController()
            self.window?.rootViewController = viewController
        }
        window?.makeKeyAndVisible()
        return true
    }
}
