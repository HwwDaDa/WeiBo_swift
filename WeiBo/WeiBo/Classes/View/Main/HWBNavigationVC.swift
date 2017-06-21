//
//  HWBNavigationVC.swift
//  WeiBo
//
//  Created by Admin on 2017/6/15.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

class HWBNavigationVC: UINavigationController {

    //重写push方法,所有的push都会调用这个方法
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        //如果不是栈底控制器不隐藏
        if childViewControllers.count > 0{
            
            viewController.hidesBottomBarWhenPushed = true
        }
        //隐藏底部的tabBar
        
        super.pushViewController(viewController, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}
