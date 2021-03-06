//
//  HWBHomeViewController.swift
//  WeiBo
//
//  Created by Admin on 2017/6/15.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

//定义全局的敞亮，不然到处可以访问
private let cellId = "cellId"

private var statusList = [String]()


class HWBHomeViewController: HWBBaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
//    加载数据
    override func loadData() {
        
//        在swift中GCD有了很大的变化，这个变化就是我们需要用队列调用，在尾随闭包回调的时候必须用self
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            for i in 0..<15 {
                if self.isPullup{
                    statusList.append("上啦 \(i)")
                    
                }else{
                    //每次将数据插入到顶部
                    statusList.insert(i.description, at: 0)
                }
            }
            
            self.refreshControl?.endRefreshing()
            
            
//                    完事后恢复上拉刷新
            self.isPullup = false
            
            //            刷新tableView
            self.tableView?.reloadData()
        }
        
        
        
    }
    
    /// 显示好友
    func showFriend() {
        print("好友")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

// 表格数据源方法
extension HWBHomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //取cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = statusList[indexPath.row]
        
        return cell
        
    }
}

extension HWBHomeViewController{

    //重写父类的方法
    override func setupUI() {
        super.setupUI()
        
        
        
        //导航栏的设置
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "好友", fontSize: 16, target: self, action: #selector(showFriend))
        
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}
