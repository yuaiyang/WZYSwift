//
//  OneViewController.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/5.
//  Copyright © 2017年 sgx. All rights reserved.
//  一些最基础的知识

import UIKit

class OneViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 调用方法 创建一个视图
        uiViewDemo()
        
        // 调用方法 方法携带两个参数
        // MARK: -guard  守卫、守护 guard let和if let刚好相反
        guardDemo(name: "wzy", age: nil)
        print("------------------")
        guardDemo(name: "wzy", age: 20)
        print("------------------")
        ifDemo(name: "wzy", age: 20)
        print("------------------")
        ifDemo(name: "wzy", age: nil)
        print("------------------")
        
        // MARK: -if的其他判断
        ifDemo1()
        print("------------------")
        // MARK: ??三目
        sanMuDemo(a: 10, b: 10)
        print("------------------")
        sanMuDemo(a: 10, b: nil)
        
        // MARK: switch的使用
        print("------------------")
        switchDemo(num: "9")
        switchDemo(num: "8")
        switchDemo(num: "6")
    }
    
    func uiViewDemo() {
        let v = UIView(frame: CGRect(x: 20, y: 20, width: 100, height: 50))
        v.backgroundColor = UIColor.red
        self.view.addSubview(v)
        
        let l = UILabel(frame: CGRect(x: 0, y: 0, width: v.frame.width, height: 20))
        l.text = "测试lable"
        l.textAlignment = NSTextAlignment.center
        l.textColor = UIColor.blue
        v.addSubview(l)
        
        // 主要和OC区分枚举类型 OC UIButtonTypeContactAdd
        //                  Swift .contactAdd
        let btn = UIButton(type: .contactAdd)
        btn.frame = CGRect(x: 0, y: 30, width: v.frame.width, height: 20)
        btn.addTarget(self, action: #selector(didClickBtn), for: .touchUpInside)
        v.addSubview(btn)
    }
    
    func didClickBtn(btn: UIButton) -> () {
        // 打印当前方法
        print(#function)
        print("点击加号按钮，方法：" + #function)
        // 打印携带参数按钮
        print(btn)
    }
    
    // 定义函数
    func guardDemo(name: String?, age: Int?) {
        guard let name = name,let age = age else {
            print("”guard“Name或者Age为空")
            // 注意这里一定要使用return 否则会报错
            return
        }
        print("guard" + name + String(age) + "岁")
        
        /*
         总结：使用guard同时使用相同变量名，在后续使用中都是非空值，不需要解包，也可以避免起名字的烦恼
            在判断较多时，使用guard可以降低分支层次 方便逻辑推理
         */
    }
    
    func ifDemo(name: String?, age: Int?) {
        if let name = name,let age = age{
            print("if" + name + String(age) + "岁")
        } else {
            print("“if”Name或者Age为空")
        }
    }
    
    func ifDemo1() {
        // 定义变量可以直接定义自动推导
        var a = "zyw"
        let b = "wzy"
        let c = 30
        let d:Optional = 10
        // 输出结果Optional(10)，提示这是一个可选值 目前用于做什么还不明白？？？
        print(d as Any)
        
        a = "zy"
        print(a + String(c) + "啦")
        print(b + String(c) + "啦")
        
        // 定义变量也可以指定类型
        let zyName: String? = "wzy"
        //        let zyAge: Int? = nil
        let zyAge: Int? = 20
        let wzyAge: Int? = nil
        
        if zyName != nil && zyAge != nil {
            // 这里需要使用！进行强行解包 强行解包有有风险，当值为空时会造成崩溃
            print(zyName! + String(zyAge!) + "岁")
        }
        
        if var name = zyName {
            name = "zy"
            // 这里 如果zyAge为nil就会崩溃 因为进行了强行解包
            print("ifDemo1 如果zyAge为nil就会崩溃" + name + String(zyAge!))
            // 使用简单三目判断重新赋值就不会崩溃 ？？ 表示 如果有值就用原来的值 如果为nil就用后面附上的值
            print("ifDemo1 如果wzyAge为nil也不会崩溃" + name + String(wzyAge ?? 10))
        }
        
        // if let连用，判断对象的值是否为nil，因此 {}内一定有值，可以直接使用 不需要解包 和上面方法对比
        if var name = zyName,let age = wzyAge {
            name = "zy"
            // 这里 如果wzyAge为nil也不会崩溃，因为判断已经进行了处理
            print("ifDemo1 如果wzyAge为nil也不会崩溃" + name + String(age))
        } else {
            print("ifDemo1 如果wzyAge为nil也不会崩溃")
        }
    }
    
    // ？？操作符优先级较低，使用时尽量使用（）提高优先级
    func sanMuDemo(a: Int?, b:Int?) {
        // 强行解包有风险 如果值为nil会造成崩溃
//        print(a! + b!)
        print((a ?? 10) + (b ?? 20))
    }
    
    // switch 可以针对任意类型的值进行分支，不局限于整数
    // switch 一般不需要使用break break主要是用于直接返回三目也不做
    // switch 如果多个值执行相同操作 直接 , 分开参数即可
    // switch 所有的分支至少需要一个指令，什么都不做就必须使用一个break
    func switchDemo(num: String) {
        switch num {
        case "10","9":
            print("hao")
        case "8":
            break
        default:
            print("cha")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: -OC和Swift方法对比
/*
 1.OC 中[{UIView alloc] initWithXXX:]
 Swift UIView(XXX:)
 UIView
 
 类名（）  == alloc / init等价
 2.类方法
 OC [UIColor redColor]
 Swift UIColor.red()
 
 3.访问当前对象属性，可以不适用self 也不建议使用
 不适用原因：闭包（类似于 OC中block），需要使用self，不使用是为了避免混淆
 
 4.枚举类型 OC UIButtonTypeContactAdd
 Swift .contactAdd
 
 5.监听方法
 OC @selector(<#selector#>) 携带参数需要加‘：’
 Swift #selector(<#selector#>) 携带参数不需要加‘：’
 */
// MARK: -总结
/*
 1.定义  可选项使用 ？
 2.解包使用 ！  注意：如果解包发现nil值会崩溃 慎重少使用或者使用guard先进行判断
 3.简单三目 ？？ 表示 如果有值就用原来的值 如果为nil就用后面附上的值
    ？？操作符优先级较低，使用时尽量使用（）提高优先级
 */
