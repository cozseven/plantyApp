//
//  PlantTabBarViewController.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Foundation
import UIKit

class PlantTabBarViewController: UITabBarController {

    private let itemImageSize = CGSize(width: 25, height: 25)
    
   var middleButton = UIButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
        configureViewControllers()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

// MARK: - Configure
extension PlantTabBarViewController {

    private func configureTabBar() {
        delegate = self
        tabBar.backgroundColor = .white
        tabBar.itemPositioning = .centered
        tabBar.tintColor = UIColor(red: 0.16, green: 0.69, blue: 0.43, alpha: 1)
        middleButton.frame.size = CGSize(width: 64, height: 64)
        middleButton.backgroundColor = UIColor(red: 0.16, green: 0.69, blue: 0.43, alpha: 1)
        middleButton.layer.cornerRadius = 32
        middleButton.layer.masksToBounds = true
        middleButton.layer.borderWidth = 4
        middleButton.layer.borderColor = UIColor(red: 0.16, green: 0.69, blue: 0.43, alpha: 0.5).cgColor
        middleButton.center = CGPoint(x: tabBar.frame.width / 2 , y: 5)
        middleButton.setImage(UIImage(named: "camera"), for: .normal)
        tabBar.addSubview(middleButton)
    }

    func configureViewControllers() {
        guard viewControllers == nil else { return }
        viewControllers = [createHomeViewController(),
                           createDiagnoseViewController(),
                           createMyGardenViewController(),
                           createMyProfileController()]
    }

    private func createHomeViewController() -> UIViewController {
        let viewController = HomeViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.tabBarItem = createTabBarItem(image: UIImage(named: "home") ?? UIImage(), title: "Home")
        return navigationController
    }

    private func createDiagnoseViewController() -> UIViewController {
        let viewController = EmptyViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.tabBarItem = createTabBarItem(image: UIImage(named: "diagnose") ?? UIImage(), title: "Diagnose")
        return navigationController
    }

    private func createMyGardenViewController() -> UIViewController {
        let viewController = EmptyViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.tabBarItem = createTabBarItem(image: UIImage(named: "garden") ?? UIImage(), title: "My Garden")
        return navigationController
    }

    private func createMyProfileController() -> UIViewController {
        let viewController = EmptyViewController()
        let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.tabBarItem = createTabBarItem(image: UIImage(named: "profile") ?? UIImage(), title: "My Profile")
        return navigationController
    }

    private func createTabBarItem(image: UIImage, title: String, size: CGSize = CGSize(width: 74, height: 49)) -> UITabBarItem {
        let image = image
        let tabBarItem = UITabBarItem()
        tabBarItem.image = image
        tabBarItem.selectedImage = image
        tabBarItem.title = title
        return tabBarItem
    }
}

// MARK: - Actions
extension PlantTabBarViewController {

}

// MARK: - UITabBarControllerDelegate
extension PlantTabBarViewController: UITabBarControllerDelegate {
    
}
