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
    
// MARK:    用户登录标记
    var userLogon = false
    
//  表格视图，因此不能用懒加载
    var tableView: UITableView?
//    可选的刷新空间
    var refreshControl: UIRefreshControl?
    
//    上拉刷新标记
    var isPullup = false
    
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
    lazy var navItem = UINavigationItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        loadData()
    }

    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
//     加载数据，具体的实现子类实现就可以了
    func loadData() {
        refreshControl?.endRefreshing()
    }

}


// MARK: - 设置UI的东西
extension HWBBaseViewController{
    func setupUI(){
        view.backgroundColor = UIColor.white
//        取消自动缩进 - 如果隐藏了导航栏会缩进20个点
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
//    用户是否登录判断
        userLogon ? setupTableView() : setupVisitorView()
        
    }
    
//    MARK: 设置访客视图
    private func setupVisitorView(){
        let visitorView = WBVisitorView(frame: view.bounds)
        view.insertSubview(visitorView, belowSubview: navigationBar)
        
    }
    
//    设置表格视图
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        
//        view.addSubview(tableView!)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        
//        设置数据源和代码方法 ->让自类直接实现数据源方法
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.contentInset = UIEdgeInsetsMake(navigationBar.bounds.height, 0, tabBarController?.tabBar.bounds.height ?? 49, 0)
        
//        设置刷新空间
//        ->实例化空间
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
//        添加到视图
        tableView?.addSubview(refreshControl!)
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        在现实最后的一行的时候做上啦刷新，先判断是否是最后一行
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        
//        判断
        if row < 0 || section < 0 {
            return
        }
        
        let count = tableView.numberOfRows(inSection: section)
        if row == count - 1 && !isPullup {
            print("上拉刷新")
            isPullup = true
            
//            开始刷新
            loadData()
        }
        
    }
}


