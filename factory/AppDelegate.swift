//
//  AppDelegate.swift
//  factory
//
//  Created by Qing Chen on 2018/5/3.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarController: CYLTabBarController!
    var welcomeVC = UINavigationController(rootViewController:WelcomeViewController())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = UIColor.white
        setupViewControllers();
       // window?.rootViewController = welcomeVC;
        window?.rootViewController = tabBarController
        registerNotification()
        window?.makeKeyAndVisible()
        
        // Override point for customization after application launch.
        return true
    }
    
    
    func logout(){
        SharedData.user = nil;
        WGUtil.setWindowRootVC(vc: welcomeVC, animated: true);
    }
    
    @objc func receiveObserve(noti: Notification){
        if noti.name.rawValue == kWG_NOTIFICATION_ACCOUNT_LOGIN_OTHER{//其它手机登录
            logout();
        } else if noti.name.rawValue == kWG_NOTIFICATION_ACCOUNT_LOGOUT{ //退出
            logout()
        }else if noti.name.rawValue == kWG_NOTIFICATION_ACCOUNT_LOGIN_SUCCESS{ //登录成功
            WGUtil.setWindowRootVC(vc: tabBarController, animated: true);
        }
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

extension AppDelegate {
    fileprivate func setupViewControllers(){
        let firstNav = UINavigationController(rootViewController:HomeViewController());
        let secondVC = UINavigationController(rootViewController:DiscoveryViewController());
        let thirdVC = UINavigationController(rootViewController:MessageViewController());
        let fourthVC = UINavigationController(rootViewController:MeViewController());
        let tabBarCtrl = CYLTabBarController();
        customTabBarForController(tabBarController: tabBarCtrl);
        tabBarCtrl.viewControllers = [firstNav,secondVC,thirdVC,fourthVC];
        tabBarCtrl.tabBar.backgroundColor = UIColor.white;
        SharedData.tabBarHeight = tabBarCtrl.tabBar.frame.size.height
        tabBarController = tabBarCtrl;
    }
    
    private func customTabBarForController(tabBarController: CYLTabBarController){
        let dict1 = [
            CYLTabBarItemImage : "home_un_select",
            CYLTabBarItemSelectedImage : "home_select"
        ];
        let dict2 = [
            CYLTabBarItemImage : "discover_un_select",
            CYLTabBarItemSelectedImage : "discover_select"
        ];
        
        let dict3 = [
            CYLTabBarItemImage : "message_un_select",
            CYLTabBarItemSelectedImage : "message_select"
        ];
        let dict4 = [
            CYLTabBarItemImage : "me_un_select",
            CYLTabBarItemSelectedImage : "me_select"
        ];
        tabBarController.tabBarItemsAttributes = [dict1,dict2,dict3,dict4];

    }
    
    
    fileprivate func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(receiveObserve(noti:)), name: NSNotification.Name(kWG_NOTIFICATION_ACCOUNT_LOGIN_OTHER), object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(receiveObserve(noti:)), name: NSNotification.Name(kWG_NOTIFICATION_ACCOUNT_LOGOUT), object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(receiveObserve(noti:)), name: NSNotification.Name( kWG_NOTIFICATION_ACCOUNT_LOGIN_SUCCESS), object: nil);
    }
    
    
}

