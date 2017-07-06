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
    lazy var iconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    lazy var houseIconView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    
//    懒加载属性只有调用UIKit的控件指定的构造函数
    lazy var tipLable: UILabel = UILabel.cz_label(withText: "关注一些人，回这里看看什么惊喜关注一些人，回这里看看什么惊喜", fontSize: 14, color: UIColor.darkGray)
    
    lazy var registerButton: UIButton = UIButton.cz_textButton("注册", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.darkGray, backgroundImageName: "common_button_white_disable")
    
    lazy var loginButton: UIButton = UIButton.cz_textButton("登录", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.darkGray, backgroundImageName: "common_button_white_disable")
}

extension WBVisitorView {
    func setupUI() {
        backgroundColor = UIColor.white
        
//        添加控件
        addSubview(iconView)
        addSubview(houseIconView)
        addSubview(tipLable)
        addSubview(registerButton)
        addSubview(loginButton)
        
//        取消autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
//        自动布局
//        图像视图
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -60))
        
//        小房子
        addConstraint(NSLayoutConstraint(item: houseIconView, attribute: .centerX, relatedBy: .equal, toItem: iconView, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: houseIconView, attribute: .centerY, relatedBy: .equal, toItem: iconView, attribute: .centerY, multiplier: 1.0, constant: 0))
        
    }
}
