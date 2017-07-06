//
//  WBVisitorView.swift
//  WeiBo
//
//  Created by Admin on 2017/7/6.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

//访客视图
class WBVisitorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK:私有控件
    private lazy var iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    private lazy var houseIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
//    懒加载属性只有调用UIKit的控件指定的构造函数
    private lazy var tipLable: UILabel = UILabel.cz_label(withText: "关注一些人，回这里看看什么惊喜关注一些人，回这里看看什么惊喜", fontSize: 14, color: UIColor.darkGray)
    
    private lazy var registerButton: UIButton = UIButton.cz_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.darkGray, backgroundImageName: "common_button_white_disable")
    
    private lazy var loginButton: UIButton = UIButton.cz_textButton("登录", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.darkGray, backgroundImageName: "common_button_white_disable")
}

extension WBVisitorView {
    func setupUI() {
        backgroundColor = UIColor.white
        
    }
}
