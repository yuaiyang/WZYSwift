//
//  MianXiangDuiXiangVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/12.
//  Copyright © 2017年 wzy. All rights reserved.
//  命名空间
//  在Swift中，默认同一个项目中（同一个命名空间下）所有的类都是共享的 可以直接访问 不需要导入
//  所有对象的属性 var都可以访问到


import UIKit

class MianXiangDuiXiangVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //  命名空间
        mingMinKongJian()
        
        // 继承自MianxiangDuiXiangPerson的对象Student
        jiCheng()
        
        // 重写和重载的区别
        chongXieChongZai()
        
        // 重载的类的继承
        chongZaiLeiDeJiCheng()
    }
    
    func chongZaiLeiDeJiCheng() -> () {
        let t = ChongZaiJChStudent(name: "重载后父类的名字", number: "重载后子类的名字")
        print(t)
        print(t.name + t.number)
    }
    
    func chongXieChongZai() -> () {
//        let p = ChongZaiPerson()
        let p1 = ChongZaiPerson(name: "王")
        
//        print("原始值\(p.name) 重新赋值\(p1.name)")
        print("重新赋值\(p1.name)")
    }
    
    func jiCheng() -> () {
        let p = MianxiangDuiXiangPerson()
        print(p)
        let s = JiChengStudent()
        print(s.name + s.number)
    }
    
    func mingMinKongJian() -> () {
        // 实例化 person
        let p = MianxiangDuiXiangPerson()
        
        print(p)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}

/*
 1.在Swift中，所有类都默认有一个命名空间
 2.OC定义类的时候，会有前缀
 3.同一个person类，从属于不同的命名空间
 
 */

