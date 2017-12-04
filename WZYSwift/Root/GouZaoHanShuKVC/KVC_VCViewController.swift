//
//  KVC_VCViewController.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/13.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class KVC_VCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //KVC函数基本实现
        demo()
        //KVC私有属性
        demo1()
        //KVC继承子类 字典内容多了处理办法 属性
        demo2()
    }
    
    func demo() -> () {
//        let p = KVCPerson(name: "KVC")
        let p = KVCPerson(dict: ["name": "老王"])
        
        print(p.name ?? "")
        
    }
    
    func demo1() -> () {
        let p = KVCPerson1(dict: ["name": "老王","age": 20])
        
        print("\(p.name) + \(p.age)")
        
        // 以下包含私有属性调用运行都会崩溃
        
//        let p1 = KVCPerson1(dict: ["name": "老王","age": 20,"title":"hhh"])
//        // 111111111
//        print("\(p1.name) + \(p1.age)" +  (p1.title)!)
        
//        let p1 = KVCPerson1(dict: ["name": "老王","age": 20,"title":"hhh"])
//        // 111111111
//        print("\(p1.name) + \(p1.age)")
    }
    
    func demo2() -> () {
        let s = KVCStufent(dict: ["name": "老王子类","age": 20,"no": "20号"])
        
        print("\(s.name) + \(s.age) + \(s.no)")

        // 字典数据多了也不会崩溃
        let s1 = KVCStufent(dict: ["name": "老王子类","age": 20,"no": "20号多key值","no1": "20号"])
        
        print("\(s1.name) + \(s1.age) + \(s1.no)")
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
