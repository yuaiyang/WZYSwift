//
//  JDGZHSPerson.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/16.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class JDGZHSPerson: NSObject {
    var name :String?
    var age :Int = 0
    
    // 重载构造函数 遍历构造函数允许返回nil
    // -正常的构造函数一定会创建对象
    //  -判断给定的参数时候符合条件，如果不符合条件，直接返回nil，就不糊其创建对象，减少内存开销
    // 注意： 只有 遍历构造函数中使用 self.init 构造当前对象
    // 没有convenience关键字的构造函数是负责创建对象的，反之用来检查条件的，本身不负责对象的创建
    // 如果要在遍历构造函数中使用 当前对象的属性 一定要在self.init 后面
    convenience init?(name: String, age: Int) {
        if age >= 100 {
            return nil
        }
        // 先实例化对象 在给自身属性赋值
        self.init()
        
        self.name = name
        self.age = age
    }
    
    override init() {
        super.init()
    }
    
}
