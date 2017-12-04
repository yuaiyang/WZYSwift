//
//  KVCPerson.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/13.
//  Copyright © 2017年 wzy. All rights reserved.
//


/*
 1.定义模型属性的时候，如果是对象，一般默认都是可选的
    -在需要的时候创建
    -避免写构造函数，可以简化代码
 2.使用KVC方法之前应该先调用super.init保证对象实例化完成
 
 3.注意：定义模型属性的时候，如果是基本数据类型不能设置为可选的，而且要设置初始值，否则KVC会崩溃
 
 4.注意：如果是private关键字方法或者属性，那么是不允许外界访问的，因此如果会使用到KVC赋值，那么就别使用private修饰
 */
import UIKit

class KVCPerson: NSObject {
    // name属性是可选的，在OC中很多属性都是在需要的时候创建的
    // 主要在于手机开发，内存很宝贵，有些属性并不一定需要分配空间
    // 延迟加载，在需要的时候在创建
    
//    var name:String
//    init(name: String) {
//        self.name = name
//        super.init()
//    }
    
    var name:String?
    // 重载构造函数，使用字典为本类设置初始值
    init(dict: [String: Any]) {
        // 保证对象已经完全初始化完成
        super.init()
        // KVC是OC方法 在运行时调用 要求对象必须实例化完成
        setValuesForKeys(dict)
    }
    
    
}


class KVCPerson1: NSObject {

    var name:String?
    
    //  给基本数据类型属性初始化
    //  -（var age: Int?）使用KVC会提示无法找到age的key 造成崩溃main
    //  原因：Int是一个基本数据类型的结构体，OC中没有，OC中只有基本数据类型
    
    var age:Int = 0
//    var age: Int?
    
    // -如果是private属性，使用KVC设置值同样会崩溃和上面使用（var age: Int?）崩溃是同样错误 因此无法设置
    // 注意：如果是private关键字方法或者属性，那么是不允许外界访问的
    private var title:String?
//    var title:String?
    
    
    init(dict: [String: Any]) {
        // 保证对象已经完全初始化完成
        super.init()
        // KVC是OC方法 在运行时调用 要求对象必须实例化完成
        setValuesForKeys(dict)
    }
}


class KVCPerson2: NSObject {
    var name:String?
    var age:Int = 0

    private var title:String?

    init(dict: [String: Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    // 重写父类方法：和OC调用方法一样
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        // 么有调用super，将父类代码实现完全覆盖，不会崩溃
    }
}

