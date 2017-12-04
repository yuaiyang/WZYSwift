//
//  ChongZaiPerson.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/13.
//  Copyright © 2017年 wzy. All rights reserved.
//


// 如果重载了构造函数，并且没有实现父类init方法，系统不提供init（）构造函数（默认是会有的）  因为默认的构造函数不能给本类的属性分配空间
// 调用父类构造函数之前，需要想给本类的属性设置初始值
import UIKit

class ChongZaiPerson: NSObject {
    var name: String
    // 重写
//    override init() {
//        name = "wangYU"
//        super.init()
//    }
    
    // MARK:注意可以省略上面代码
    //重载 函数名相同，当参数和个数不同 相当于OC initWithXXX
    //重载可一个自己的属性从外部设置初始值
    init(name: String) {
        // 使用参数的name给属性name赋值
        self.name = name
        super.init()
    }
    
}
