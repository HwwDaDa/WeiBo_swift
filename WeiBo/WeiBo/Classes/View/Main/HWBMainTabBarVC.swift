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
//        self.tabBar.tintColor = UIColor.orange
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
            ["clsName":"HWBHomeViewController","title":"首页","imageName":"tabbar_home"],
            ["clsName":"HWBMessageViewController","title":"消息","imageName":"tabbar_message_center"],
            ["clsName":"HWBDiscoverViewController","title":"发现","imageName":"tabbar_discover"],
            ["clsName":"HWBProfileViewController","title":"我的","imageName":"tabbar_profile"],
        
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
        //设置图片
        vc.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
        
        //设置标题字体
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .highlighted)
        
        //系统默认是十二号字体
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: UIControlState(rawValue: 0))
        
        let nav = HWBNavigationVC.init(rootViewController: vc)
        
        return nav
        
    }
}
