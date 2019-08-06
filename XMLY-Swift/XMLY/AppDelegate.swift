//
//  AppDelegate.swift
//  XMLY
//
//  Created by sandsyu on 2019/7/30.
//  Copyright © 2019 sandsyu. All rights reserved.
//

import UIKit
import ESTabBarController_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let screen = UIScreen.main.bounds        //获得设备尺寸
        self.window = UIWindow.init(frame: screen)
        let tabbar = self.setUpTabBarStyle(delegate: self as? UITabBarControllerDelegate)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = tabbar;
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func setUpTabBarStyle(delegate: UITabBarControllerDelegate?) -> ESTabBarController {
        let tabBarController = ESTabBarController()
        tabBarController.delegate = delegate
        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        
        let home = XMLYHomeController()
        let listen = XMLYListenController()
        let play = XMLYPlayController()
        let find = XMLYFindController()
        let mine = XMLYMineController()
        
        home.tabBarItem = ESTabBarItem.init(XMLYIrregularityBasicContentView(), title: "首页", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        listen.tabBarItem = ESTabBarItem.init(XMLYIrregularityBasicContentView(), title: "我厅", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        play.tabBarItem = ESTabBarItem.init(XMLYIrregularityContentView(), title: nil, image: UIImage(named: "tab_play"), selectedImage: UIImage(named: "tab_play"))
        find.tabBarItem = ESTabBarItem.init(XMLYIrregularityBasicContentView(), title: "发现", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        mine.tabBarItem = ESTabBarItem.init(XMLYIrregularityBasicContentView(), title: "我的", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))

        let homeNav = XMLYNavigationController(rootViewController: home);
        let listenNav = XMLYNavigationController(rootViewController: listen);
        let playNav = XMLYNavigationController(rootViewController: play);
        let findNav = XMLYNavigationController(rootViewController: find);
        let mineNav = XMLYNavigationController(rootViewController: mine);

        home.title = "首页"
        listen.title = "我厅"
        play.title = "播放"
        find.title = "发现"
        mine.title = "我的"
        
        tabBarController.viewControllers = [homeNav, listenNav, playNav, findNav, mineNav]
        return tabBarController;
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

