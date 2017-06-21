//
//  UIBarButtonItem+Extensions.swift
//  WeiBo
//
//  Created by Admin on 2017/6/21.
//  Copyright © 2017年 Admin. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    /// 创建 UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: title
    ///   - fontSize: 默认字体为16
    ///   - target: target
    ///   - action: action
    convenience init(title: String, fontSize: CGFloat = 16, target: AnyObject?, action: Selector) {
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(target, action: action, for: .touchUpInside)
        //实例化button
        self.init(customView: btn)
    }
}
