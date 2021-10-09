//
//  AppDelegate.swift
//  instagram clone
//
//  Created by Giulio Manuzzi on 22/09/21.
//

import UIKit

public enum StoriesCellType {
    case addStory
    case story
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = ViewController(nibName: nil, bundle: nil) //
        window?.makeKeyAndVisible()
        window?.canResizeToFitContent = true
        return true
    }

    

}

