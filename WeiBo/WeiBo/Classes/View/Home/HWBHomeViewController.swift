//
//  HWBHomeViewController.swift
//  WeiBo
//
//  Created by Admin on 2017/6/15.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

class HWBHomeViewController: HWBBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    /// 显示好友
    func showFriend() {
        print("好友")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

extension HWBHomeViewController{

    //重写父类的方法
    override func setupUI() {
        super.setupUI()
        
        
        
        //导航栏的设置
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriend))
        
    }
}
