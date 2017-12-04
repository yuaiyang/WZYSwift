//
//  HanShuDIngYIVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/9.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class HanShuDIngYIVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //调用函数
        diaoYOngHanShu()
        // 举例 _ 会造成警告原因
        ceshi()
        
        // 无返回值函数调用
        demo()
        
        //常量记录 函数
        demo4()
        
        // 闭包
        demo6()
    }
    // MARK： -闭包
    func demo6() -> () {
    // 最简单闭包
        let b1 = {
        print("Swift最简单闭包")
        }
        // 执行闭包
        b1()
        
        // 带参数的闭包
        // 闭包中 参数 返回值 实现代码都写在 {} 中
        // 需要使用一个关键字 in 分割定义和实现
        let b2 = {(x: Int,y: Int) ->() in
            print("带参数的闭包 \(x + y)")
        }
        b2(20, 20)
        
        // 带参数和返回值的闭包

        let b3 = {(x: Int,y: Int) ->Int in
            return x*y
        }
//        b3(20, 20)
        print("带参数和返回值的闭包 \(b3(20, 20))")
    }
    
    
    
    
    // MARK： -闭包（使用常量记录函数的演练）
    // 提前准备好的代码 在需要的时候调用 可以当做参数传递
    
    func demo4() -> () {
        let xy = demo5(x: 20, y: 6)
        print("直接调用 \(xy)")
        
        // 定义一个常量记录 函数
        let f = demo5
        // 在需要的时候调用
        print("调用常量记录函数 \(f(10,10))")
    }
    
    func demo5(x: Int,y: Int) -> Int {
        return x * y
    }
    
    
    // MARK： -无返回值
    /*
    主要用于闭包
     - 直接省略
     - （）
     - void
     */
    func demo() {
        demo1()
        demo2()
        demo3()
    }
    
    func demo1() {
        print("111")
    }
    // 前面执行 输出 到一个目标 正常顺序
    func demo2() -> () {
        print("222")
    }
    
    func demo3() -> Void {
        print("333")
    }
    
    // MARK： -测试
    func ceshi() {
//        for i in 0...8 {
        for _ in 0...8 {
            print("nihao")
        }
    }
    // MARK： -默认值
    // 通过给参数设置默认值，在调用的时候可以任意组合函数，如果不指定参数值，就使用默认值
    func sum3(x:Int = 1, y:Int = 2) -> Int {
        return x + y
    }
    
    func diaoYOngHanShu() {
        let a = sum(x: 20, y: 34)
        print("调用一个返回值为Int类型的函数 \(a)")
        
        // 外部参数
        print("调用一个外部参数有返回值的函数 \(sum1(num1: 12, num2: 13))")
        print(sum2(14, 15))
        // 测试默认值
        print(sum3())
        print(sum3(x: 10))
        print(sum3(y: 20))
        print(sum3(x: 10, y: 10))
    }

    
    // MARK： -外部参数
    // 外部参数 就是在形参前面增加一个名字 外部参数不会影响函数内部细节 只是让函数看起来更加直观
    func sum1(num1 x:Int, num2 y:Int) -> Int {
        return x + y
    }
    // 外部参数如果使用 _ ,在外部调用时，会忽略形参名字
    // 在Swift中 _ 就是可以忽略任意不敢兴趣的内容
    func sum2(_ x:Int, _ y:Int) -> Int {
        return x + y
    }
    
    // MARK： -函数定义 格式,函数名（形参列表）
    func sum(x:Int, y:Int) -> Int {
        return x + y
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*
 {}是代表包含了一段可执行的代码
 
 闭包的使用和OC的block用法完全一样
 */
