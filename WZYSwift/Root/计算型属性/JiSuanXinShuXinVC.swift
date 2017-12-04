
//
//  JiSuanXinShuXinVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/2/10.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class JiSuanXinShuXinVC: UIViewController {

   private lazy var p = JiSuanXinShuXinPerson()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let p = JiSuanXinShuXinPerson()
        
        // 注意 懒加载只要调用过一次，懒加载后面的闭包就再也不会执行
//        p.title3 = nil;
        
        p.name = "王"
        
        print(p.name ?? "")
        
        // p.title是一个只读属性
        print(p.title)
        // 是可读属性不能赋值
//        p.title = "张"
        print(p.title3)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 赋值p.name验证 懒加载计算后保存了结果
        p.name = "验证懒加载是否保存返回结果"
        
        print(p.title2)
        print(p.title3)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
