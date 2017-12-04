//
//  TwoViewController.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/5.
//  Copyright © 2017年 sgx. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for循环和字符串处理
//        forAndString()
        // 字典处理
        dicDemo()
        // 数组处理
        arrayDemo()
        // 遍历
//        blDemo()
    }
    
    // MARK: -遍历
    func blDemo() -> () {
        let array = ["abc","def","frs"]

        for arr in array {
            print(arr)
        }
        
        for i in 0..<array.count {
            print(array[i])
        }
        print("==========")
        // 同事遍历下标和内容
        for e in array.enumerated() {
            print("\(e.offset) \(e.element)")
        }
        
        for (m, s) in array.enumerated() {
            print("\(m) \(s)")
        }
        print("==========")
        // 反序遍历
        for s in array.reversed() {
            print(s)
        }
        print("==========")
        // 反序索引和内容
        for (m, s) in array.enumerated().reversed() {
            print("\(m) \(s)")
        }
    }
    
    // MARK: -字典处理
    func dicDemo() -> () {
        // 定义字典
        let dic1 = ["name":"wzy","age":"18"]
        print(dic1);
        
        // 新增
        var dic = ["name":"wzydic","age":"18dic"];
        dic["gender"] = "男"
        print(dic)
        // 修改
        dic["name"] = "修改wzy"
        print(dic)
        
        // 删除
        dic.removeValue(forKey: "age")
        print(dic)
        
        // 遍历字典
        for d in dic {
            print("第一种方式遍历 \(d.key) \(d.value)")
        }
        
        for (k, v) in dic {
            print("第二种方式遍历 \(k) \(v)")
        }
        
        // 合并字典
        // 思路 遍历字典如果key存在会替换，如果key不存在会新增
        var tempDic = ["tempName":"hz","tempAge":"19"]
        for d in dic {
            tempDic[d.key] = dic[d.key]
        }
        print("合并后字典 \(tempDic)")
    }
    // MARK: -数组处理
    func arrayDemo() -> () {
        // 数组定义
        arrayDemo1()
        // 数组容量
        arrayDemo2()
    }
    func arrayDemo2() -> () {
//        var array:[Int]
//        array = [Int]()
        // 等价于
        var arr = [Int]()
        print("初始容量 \(arr.capacity)")
        
        for i in 0...8 {
//            追加元素
            arr.append(i)
//            容量是在不够的基础上就增加一倍 2-4-8-16-32依次
            print("\(arr) 的容量是 \(arr.capacity)")
        }
        
    }
    
    func arrayDemo1() -> () {
        let arrry0 = ["你好","我好","大家好"]
        let arrry1 = [1,2,4]
        
        let point0 = CGPoint(x: 2.3, y: 5.6)
        let point1 = CGPoint(x: 2, y: 5)
        let arrry2 = [point0,point1]
        
        // 混合数组的定义
        let array3 = [NSValue(cgPoint: point0),"jhdshd",9] as [Any]
        
        
        print(arrry0[2])
        print("----------------")
        print("\(arrry0) \(arrry1)")
        print("----------------")
        print(arrry2)
        
        print(array3)
        
        // 定义字典数组
        let arrayDic:[[String: Any]] = [
            ["name":"wzyArrDic","age":"19"],
            ["name":"zyA","age":"20"]
        ]
        print(arrayDic)
    }
    
    // MARK: -for循环和字符串处理
    func forAndString() -> () {
        // for循环的改动
        forDemo()
        print("-------------")
        // for的逆向循环
        forReversedDemo()
        print("-------------")
        
        print("-------------")
        // 字符串处理
        stringDemo()
        print("-------------")
        // 字符串遍历
        stringForDemo()
        print("-------------")
    }
    
    func forDemo() {
        let a = 0..<3
        for b in a {
            print(b)
        }
        print("==========")
        for i in 0..<5 {
            print(i)
        }
        print("==========")
        for j in 0...5 {
            print(j)
        }
    }
    
    func forReversedDemo() {
        for i in (0..<10).reversed() {
            print(i)
        }
    }
    
    func stringDemo() {
        let str = "hello world你好"
        // 打印出来 是字节数 一个汉字3个字节
        print(str.lengthOfBytes(using: .utf8))
        // 打印出来是字符个数  一般都会使用它
        print(str.characters.count)
        // NSString和string中转 打印出来是字符个数
        let tempStr = str as NSString
        print(tempStr.length)
        
        // 字符串拼接
        var str1 = "我好"
        let str2 = "你好,一起好呀"
        let point = CGPoint(x: 1, y: 2)
        
        str1 += str2
        let str3 = "\(str1) \(str2) \(point)"
        
        print("\("字符串拼接") \(str1)")
        print("\("字符串拼接") \(str3)")
        
        // 字符串截取
        let ocStr = str1 as NSString
        let str4 = ocStr.substring(with: NSMakeRange(3, 3))
        print("\("字符串截取") \(str4)")
        
        // MARK: -以下全是一段 注意...
        guard let range = str1.range(of: "好你c") else {
            print("没找打字符串-好你")
            return
        }
        print(range)
        print(str1.substring(with: range))
        
        // MARK: -格式化
        let h = 8
        let m = 5
        let s = 20
        
        let dateStr = "\(h):\(m):\(s)"
        print(dateStr)
        // 使用格式字符串格式化
        let dateStr1 = String(format: "%02d:%02d:%02d", h,m,s)
        print(dateStr1)
    }
    

    func stringForDemo() {
        let str = "我叫wzy"
        for temp in str.characters {
            print(temp)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

/*
 
*/
