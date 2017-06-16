//
//  HWBBaseViewController.swift
//  WeiBo
//
//  Created by Admin on 2017/6/15.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

class HWBBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    

}


// MARK: - 设置UI的东西
extension HWBBaseViewController{
    func setupUI(){
        view.backgroundColor = UIColor.cz_random()
    }
}
