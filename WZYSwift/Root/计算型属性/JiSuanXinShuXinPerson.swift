//
//  JiSuanXinShuXinPerson.swift
//  WZYSwift
//
//  Created by ylcf on 17/2/10.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class JiSuanXinShuXinPerson: NSObject {

    // getter & setter 仅供演示，日常开发不用
    // 加private是为了将变量保护起来
    private var _name:String?
    // Swift中一般不会重写getter和setter方法
    var name: String? {
        get {
            // 返回_成员变量
            return _name
        }
        
        set{
            // 使用成员变量 记录
            _name = newValue
        }
    
    }
    
    // 只读属性 又称为 计算型属性 -> 本身不保存内容，都是通过计算获得结果
    // 常规写法
    // OC中定义属性readonly ->重写getter方法
    var title:String {
        get {
            return "MR." + (name ?? "")
        }
    }
    // 简写
    // 每次都会计算 和懒加载区别
    var title2: String {
        return "Mr." + (name ?? "")
    }
    
    // 懒加载的title 本质是一个闭包
    // 懒加载会在第一次访问的时候 执行 闭包执结束后 会把结果保存在title中
    // 后续调用 直接返回 title3 的内容
    // 懒加载的属性会分配空间存储值
    // 以下加一个？号 是表示可选
    lazy var title3: String? = {
        return "lazy" + (self.name ?? "")
    }()
}
