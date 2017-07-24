//
//  AppDelegate.swift
//  WeiBo
//
//  Created by Admin on 2017/6/15.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        window?.rootViewController = HWBMainTabBarVC()
        window?.makeKeyAndVisible()
        
        loadAppInfo()
        
        return true
    }
}

extension AppDelegate{
    func loadAppInfo() {
        DispatchQueue.global().async {
            //异步加载数据
            let url = Bundle.main.url(forResource: "main.json", withExtension: nil)
            let data = NSData(contentsOf: url!)
            
            //写入磁盘
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
            data?.write(toFile: jsonPath, atomically: true)
            
            print("应用程序加载完毕:\(jsonPath)")
        }
    }
}

