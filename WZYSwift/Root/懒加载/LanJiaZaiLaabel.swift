
//
//  LanJiaZaiLaabel.swift
//  WZYSwift
//
//  Created by ylcf on 17/2/10.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class LanJiaZaiLaabel: UILabel {

    // 重写构造函数
    // 纯代码专用 xib/ Storyboard不会调用
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
//    // initWithCoder -> 在使用Xib / Storyboard 开发的入口 纯代码不会调用
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // 如果需要使用纯代码又需要使用xib 这种情况一般用于框架
        // initWithCoder -> 在使用Xib / Storyboard 开发的入口 纯代码不会调用
        // 注意：所有UIView及其子类在开发时，一旦重写了构造函数 必须实现initWithCoder函数，以保证提供两个通道
        // 方法添加有智能提示
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupUI()
            
            // fatalError : 如果用xib开发会直接崩溃
            // 禁止xib / Storyboard使用本类
//            fatalError("init(coder:) has not been implemented")
        }

    
    func setupUI() {
        
    }
    
}
