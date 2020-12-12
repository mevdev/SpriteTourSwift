//
//  AppDelegate.swift
//  SpriteTourSwift
//
//  Created by Robert Linnemann on 12/12/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = MenuViewController()
        let navigation : UINavigationController = UINavigationController(rootViewController: vc)
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

