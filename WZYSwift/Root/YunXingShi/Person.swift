//
//  Person.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/13.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name:String?
    var age:Int = 0
    var title:String?
    
    // 目标：[]获取当前类所有属性的数组
    // 获取 ivar列表是所有第三方框架字典转模型的基础
    class func propertyList() ->[String] {
        
        var count:UInt32 = 0
        
        
        // 1.获取类的属性列表,但会属性列表的数组
        let list = class_copyPropertyList(self, &count)
        
        print("属性列表数量 \(count)")
        
        // 遍历数组
//        for i in 0..<Int(count) {
////            根据下标获取属性
//            let pty = list?[i]
////            获取 属性 的名称 C语言字符串
////            Int8 - byte - char 就是C语言的字符串
//            let CName = property_getName(pty)
////            转换成String 的字符串
//            let name = String(utf8String: CName!)
//            print(name ?? "")
//        }
        
        // 改进以上for循环代码 去掉！
        // 使用guard逐层判断是否有值
        for i in 0..<Int(count) {
            guard let pry = list?[i],
            let CName = property_getName(pry),
            let name = String(utf8String: CName)
                else {
                    // 继续遍历下一个
                continue
            }
            print(name)
        }
        
        // MARK: -注意：要释放C语言的对象
        free(list)
        return []
    }
    
}



/*
 1.在运行时不能将基本数据类型写为 var age: Int？,这样会导致运行时拿不到age，一旦使用KVC就会崩溃
 2.在运行时使用关键字private，使用运行时同样获取不到属性，同样会让 KVC 崩溃，所以不能使用private
 
 */
