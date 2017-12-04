//
//  SetUpUIViewController.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/9.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class SetUpUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建按钮
        setUpButton()
        
    }
    
    func setUpButton() -> () {
        let btn = UIButton()
        
        // raw 原始的，使用一个值调用枚举的构造函数，创建一个枚举值
        btn.setTitle("按钮", for: UIControlState(rawValue: 0))
        btn.setTitleColor(UIColor.red, for: UIControlState(rawValue: 0))
        btn.frame = CGRect(x: 20, y: 20, width: 200, height: 30)
        
        view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*
 在swift中
 类 枚举 结构体 这三个函数都可以方法，整体看起来，都有源于的类
 */
