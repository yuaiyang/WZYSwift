//
//  GCDViewController.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/9.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 简单GCD
        loadData()
        // GCD传递参数调用
        loadData1 { (result) in
            print("获取的数据 \(result)")
        }
        
        loadData1(completion: {(result)->() in
             print("实际原始写法 获取的数据 \(result)")
        })
        
    }

    func loadData1(completion:@escaping (_ result: [String]) ->()) -> () {
        // 将任务添加队列，指定执行任务函数
        DispatchQueue.global().async {
            print("耗时操作 \(Thread.current)")
            
            // 休眠
            Thread.sleep(forTimeInterval: 10)
            let json = ["你好","我好","大家好"]
            
            // 回调主队列
            DispatchQueue.main.async(execute: {
                print("更新UI \(Thread.current)")
                // 回调 执行闭包
                completion(json)
            })
        }
    }
    
    func loadData() -> () {
        // 将任务添加队列，指定执行任务函数
        DispatchQueue.global().async {
            print("耗时操作 \(Thread.current)")
            
            // 回调主队列 execute执行
            DispatchQueue.main.async(execute: {
                print("更新UI \(Thread.current)")
            })
            
            // MARK: -注意和以上方法区别 execute
            DispatchQueue.main.async {
                print("更新UIIII \(Thread.current)")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


/*
 总结：尾随闭包  如果函数的最后一个参数时闭包，函数可以提前结束，最后一个参数直接使用{}包装闭包代码
 关于尾随闭包：嵌套的尾随闭包不会自动转换
 */
