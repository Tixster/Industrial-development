//
//  AppDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBar = TabBarViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        print(type(of: self), #function)

        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print(type(of: self), #function)

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(type(of: self), #function)

    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(type(of: self), #function)

    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(type(of: self), #function)
        // Background time remaining = 29.465128500014544 seconds
        
    }
}
