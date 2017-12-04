//
//  LanJiaZaiVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/2/10.
//  Copyright © 2017年 wzy. All rights reserved.
//

/*
    懒加载注意事项：
    1.一旦懒加载控件被置为nil，懒加载也不会再次执行（不同于OC）
    2.懒加载的代码只会在第一次调用的时候，执行闭包，然后将闭包的结果保存在控件的属性中
 
 其他注意：在内存警告方法中
 Swift中一定注意不要主动清理视图或者控件，因为懒加载不会再次创建
 */

import UIKit

class LanJiaZaiVC: UIViewController {
    
    //测试1
//    var lable: LanJiaZaiLaabel?
    //测试2
//    var label = LanJiaZaiLaabel()
    
    //测试3 懒加载 定义 加lazy 和指定创建类型
    lazy var label: LanJiaZaiLaabel = LanJiaZaiLaabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //测试1 没使用懒加载
//        setupUICeShi1()
        
        //测试2 没使用懒加载 先创建lable后设置UI
//        setupUICeShi3()
        
        //测试3 使用懒加载
        setupUICeShi3()
    }

    private func setupUICeShi1(){
        //创建控件
//        lable = LanJiaZaiLaabel()
        
        // 添加到视图
//        view.addSubview(lable!)
    }
    
    private func setupUICeShi3(){
        // 添加到视图
        view.addSubview(label)
        label.text = "哈哈哈"
        label.sizeToFit()
        label.center = view.center
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     懒加载的好处：
     1.能延迟创建
     2.最大好处：解除解包烦恼
     
     {}包装代码
     （）执行代码
     懒加载本质是一个闭包 完整写法如下：不建议这么写，原因如下
     1.闭包中只能提示不精准
     2.如果闭包中出现self，还需要注意循环引用
     lazy var lable = {()->LanJiaZaiLaabel in
     
     let l = LanJiaZaiLaabel()
     return l
     }()
     */

/*
     可选项：
     目的：解决有和无的问题
     定义：只能用 ？  表示变量可以为空nil，或者有一个值
        eg：var lable: LanJiaZaiLaabel?  注意：这里只是定义，没有初始化和分配空间
     
     解包： 强行解包： ！ 目的为了参与计算 存在风险，最好判断是否为nil 可以使用guard let或者 let let
            可选解包： ？ 不能参与计算 主要用于调用方法 如果对象存在调用方法 如果方法为nil则不调用
     
     类型转换：as？ 前面的结果是可选的 if let/ guard let 一定用as？
             as!  前面的结果一定有值
             as   NSString -> String
                    NSArray -> []
                    NSDictionary -> []
                    因为底层做了结构体和OC对象的桥接
     
     需要类型转换的时候：将父类转化为子类，因为子类的属性和方法比父类多，和OC中强转类似（转换有风险：如果没有对应的属性和方法，那么会导致崩溃）
     
     
     “：”表示，我是什么什么
*/

}
