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
}

extension WBVisitorView {
    func setupUI() {
        backgroundColor = UIColor.white
        
    }
}
