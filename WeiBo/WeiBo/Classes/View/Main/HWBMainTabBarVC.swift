//
//  HWBMainTabBarVC.swift
//  WeiBo
//
//  Created by Admin on 2017/6/15.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

class HWBMainTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

//类似于OC中的分类，swift中切分代码，相近代码的函数放在一个extension便于代码维护
//和OC的分类一样，不能定义属性
//设置界面
extension HWBMainTabBarVC
{
    func setupChildController()
    {
        let array = [
            ["clsName":"HWBHomeViewController","title":"首页","imageName":""],
            ["clsName":"HWBHomeViewController","title":"首页","imageName":""],
        
        ]
        
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    //创建一个控制器
    private func controller(dict: [String : String]) -> UIViewController {
        guard let clsName = dict["clsName"],let title = dict["title"],let imageName = dict["imageName"],let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type else{
            
            return UIViewController()
        }
        
        //创建视图控制器
        let vc = cls.init()
        vc.title = title;
        let nav = HWBNavigationVC.init(rootViewController: vc)
        
        return nav
        
    }
}
