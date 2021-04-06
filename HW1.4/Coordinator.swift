//
//  Coordinator.swift
//  Navigation
//
//  Created by Кирилл Тила on 04.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController? { get set }
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        let rootViewController = TabBarViewController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
    }
    
    func start() {}
}

class FeedCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()

    var rootViewController: UIViewController = FeedViewController()
    var navigationController: UINavigationController?
    
    init() {
        navigationController = .init(rootViewController: rootViewController)
        rootViewController.tabBarItem = UITabBarItem(title: "Новости", image: #imageLiteral(resourceName: "feedicon"), selectedImage: #imageLiteral(resourceName: "feedicon"))
        rootViewController.tabBarItem.tag = 0
    }
    
    func start() {

    }
    
}

class LoginCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController
    var navigationController: UINavigationController?
    
    init() {

        let vc = LoginViewController()
        rootViewController = vc
        
        navigationController = UINavigationController(rootViewController: rootViewController)

        rootViewController.tabBarItem = UITabBarItem(title: "Профиль", image: #imageLiteral(resourceName: "profileicon"), selectedImage: #imageLiteral(resourceName: "profileicon"))
        rootViewController.tabBarItem.tag = 1
        vc.coordinator = self

    }
    
    func start() {
    }
    
    func subscription(){

        guard let nav = navigationController else { return }
        
        let child = ProfileCoordinator(nav: nav)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
    
}
class ProfileCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    weak var parentCoordinator: LoginCoordinator?
    
    var navigationController: UINavigationController?
    
    init(nav: UINavigationController) {
        self.navigationController = nav
    }
    
    func start() {
        let vc = ProfileViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
