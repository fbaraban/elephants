//
//  AppDelegate.swift
//  Elephants
//
//  Created by Wilson Baraban Filho on 10/15/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    

}

