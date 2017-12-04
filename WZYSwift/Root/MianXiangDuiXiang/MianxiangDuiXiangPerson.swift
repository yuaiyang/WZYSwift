//
//  MianxiangDuiXiangPerson.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/12.
//  Copyright © 2017年 wzy. All rights reserved.
//

/*
 初始化一个类
 1.给自己的属性分配空间并且设置初始值
 2.调用父类的“构造函数”，给父类的属性分配空间设置初始值
    NSObject 没有属性，只有一个成员变量 'isa'
 */

import UIKit

class MianxiangDuiXiangPerson: NSObject {
    var name:String
    
    // Overriding declaration requires an 'override' keyword
    // 重写 -》 父类有这个方法 子类重新实现 需要override关键字
    // Property 'self.name' not initialized at implicitly generated super.init call
    // implicitly隐式生成的 super.init  调用父类的构造函数之前，属性self.name没有被初始化
    override init() {
        
        name = "wang"
        
        // Property 'self.name' not initialized at super.init call
        // 在调用父类super.init的时候 提示给self.name -》分配空间设置初始值
        super.init()
    }
    
}

/*
 1.Person类没有 初始化器 构造函数可以有多个，默认的是init
 
 */










