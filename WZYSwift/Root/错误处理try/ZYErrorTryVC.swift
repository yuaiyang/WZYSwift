//
//  ZYErrorTryVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/17.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class ZYErrorTryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
        test1()
    }
    
    // 不推荐使用try！解析成功有值 不成功崩溃
    private func test() {
        let jsonStr = "{\"name\": \"wang\"}"
        
        
        guard let data = jsonStr.data(using: .utf8) else {
            return
        }
        // 反序列化throw 跑出异常
        // 推荐使用 try？ 解析成功有值 不成功返回nil
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        print(json ?? "出错啦")
        
    }

    // 不建议使用  处理异常 可以接收到错误信息
    /*
     1.语法结构复杂，且{}里面很可能没有智能提示
     2.OC中没有try catch 为什么  原因：arc开发，编译器会自动添加retain release autorelease  如果使用try catch 一旦造成不平衡就会导致内存泄漏
     */
    private func test1() {
        let jsonStr = "{\"name\": \"wang\"}"
        
        
        guard let data = jsonStr.data(using: .utf8) else {
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        } catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
