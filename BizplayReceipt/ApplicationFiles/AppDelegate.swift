//
//  AppDelegate.swift
//  BizplayReceipt
//
//  Created by Webcash on 2019/12/13.
//  Copyright © 2019 WebCash. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func changeRootToMain() {
        let myRcptSb = UIStoryboard(name: "MyReceiptSB", bundle: nil)
        let myReceiptVc = myRcptSb.instantiateViewController(withIdentifier: "ReceiptViewController_sid")
        let newNavigationBar = UINavigationController(rootViewController: myReceiptVc)
        newNavigationBar.navigationBar.isTranslucent = false
//        newNavigationBar.navigationBar.backgroundColor = .dodgerBlue
        window?.rootViewController = newNavigationBar
    }

}
