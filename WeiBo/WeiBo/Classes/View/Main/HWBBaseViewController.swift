//
//  HWBBaseViewController.swift
//  WeiBo
//
//  Created by Admin on 2017/6/15.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

class HWBBaseViewController: UIViewController {
//  表格视图，因此不能用懒加载
    var tableView: UITableView?
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override var title: String?{
        didSet{
            navItem.title = title
        }
    }

}


// MARK: - 设置UI的东西
extension HWBBaseViewController{
    func setupUI(){
        view.backgroundColor = UIColor.cz_random()
        
        
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        //添加导航条
        view.addSubview(navigationBar)
        
        navigationBar.items = [navItem]
        
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
    }
}


