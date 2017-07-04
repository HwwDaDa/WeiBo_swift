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
        setupComposeButton()
    }
    
//    - 支持的设法方向,一般时候默认支持多个方向，因为后面加视频播放的页面，这个页面是支持横屏的
//    - 这个方法是控制器定义的，在设置支持方向之后当前的控制器和子控制器都会遵守这个方向，如果播放视频是通过modal出来的
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .portrait
    }

    //private只能在本类使用，
    //@bojc，在运行时通过OC的消息机制被使用
    func composeStatus() {
        print("写微博")
        //测试方向旋转
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.cz_random()
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true, completion: nil)
    }
    
    lazy var composeButton:UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
}

//类似于OC中的分类，swift中切分代码，相近代码的函数放在一个extension便于代码维护
//和OC的分类一样，不能定义属性
//设置界面
extension HWBMainTabBarVC
{
    func setupComposeButton(){
        tabBar.addSubview(composeButton)
        //设置按钮的位置
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count
        
        composeButton.frame = tabBar.bounds.insetBy(dx: 2 * w, dy: 0)
        composeButton.addTarget(self, action: #selector(composeStatus), for: .touchUpInside)
        
    }
    
    func setupChildController()
    {
        let array = [
            ["clsName":"HWBHomeViewController","title":"首页","imageName":"tabbar_home"],
            ["clsName":"HWBMessageViewController","title":"消息","imageName":"tabbar_message_center"],
            ["clsName":"","title":"","imageName":""],
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
