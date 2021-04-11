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
        let feed = FeedCoordinator()
        let login = LoginCoordinator()
        
        guard let feedNavControlle = feed.navigationController,
              let loginNavController = login.navigationController
        else { return }
        
        let subviewContrlolers = [feedNavControlle, loginNavController]
        
        self.setViewControllers(subviewContrlolers, animated: true)
        self.selectedIndex = 0
        self.tabBar.tintColor = .systemBlue
        self.selectedViewController = feed.navigationController
        
    }
}
