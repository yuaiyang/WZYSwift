//
//  LiYOngMoXingLabel.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/14.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class LiYOngMoXingLabel: UILabel {

    // 模型 -》 给视图设置模型，由视图自己根据模型的数据，决定显示内容
    var person: LiYongMoXingPerson? {
        // 这里没有提示
        // 重要 替代OC重写setter方法
        // 区别： 再也不需要考虑 _成员变量 = 值！
        // OC 中如果是copy属性 应该 _成员变量 = 值.copy;
        didSet {
            // 在这里 name属性已经有值，可以直接设置UI内容
            text = person?.name
        }
    }
    
    

}
