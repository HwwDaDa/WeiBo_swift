//
//  HWBBaseViewController.swift
//  WeiBo
//
//  Created by Admin on 2017/6/15.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

//OC重支持多继承码，不支持，答案是使用协议替代
//swift的这种方法类似于多继承，这就是不同于OC的地方
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
        setupTableView()
    }
    
//    设置表格视图
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        
//        view.addSubview(tableView!)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
//        设置数据源和代码方法 ->让自类直接实现数据源方法
        tableView?.delegate = self
        tableView?.dataSource = self
        
    }
    
    private func setupNavigationBar(){
        //添加导航条
        view.addSubview(navigationBar)
        
        navigationBar.items = [navItem]
        
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGray]
        navigationBar.isTranslucent = false;
    }
}

//遵守协议
extension HWBBaseViewController:UITableViewDelegate,UITableViewDataSource{
    
    //基类准备方法，子类不需要继承，重写方法就可以了
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


