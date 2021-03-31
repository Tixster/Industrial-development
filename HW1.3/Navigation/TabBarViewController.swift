//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Кирилл Тила on 20.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        
    }
    
    private func setupTabBar(){
        self.view.backgroundColor = .white
        
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        let profileVC = UINavigationController(rootViewController: LoginViewController())
        let subviewContrlolers = [feedVC, profileVC]
        
        feedVC.tabBarItem = UITabBarItem(title: "Новости", image: #imageLiteral(resourceName: "feedicon"), selectedImage: #imageLiteral(resourceName: "feedicon"))
        feedVC.tabBarItem.tag = 0
        
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "profileicon"), selectedImage: #imageLiteral(resourceName: "profileicon"))
        profileVC.tabBarItem.tag = 1
        
        
        
        self.setViewControllers(subviewContrlolers, animated: true)
        self.selectedIndex = 0
        self.tabBar.tintColor = .systemBlue
        self.selectedViewController = feedVC
        
    }
}
