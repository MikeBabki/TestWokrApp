//
//  AppDelegate.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 04.06.2023.
//

import UIKit
import IQKeyboardManagerSwift
import CocoaDebug

@main

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
   
        
        IQKeyboardManager.shared.enable = true
        CocoaDebug.enable()
        
        
         if let token = KeychainManager.getToken(service: "restapi.adequateshop.com") {
             showCatalogView()
             print("show CatalogScreen is happened")
         } else {
             showStartView()
             print("show Login screen is happened")
         }
        return true
    }
    
    func showCatalogView() {
         let mainViewController = BeerCatalogViewController()
         let navigationController = UINavigationController(rootViewController: mainViewController)
         window?.rootViewController = navigationController
         window?.makeKeyAndVisible()
     }
     
     func showStartView() {
         let loginViewController = StartScreenViewController()
         let navigationController = UINavigationController(rootViewController: loginViewController)
         window?.rootViewController = navigationController
         window?.makeKeyAndVisible()
     }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}
