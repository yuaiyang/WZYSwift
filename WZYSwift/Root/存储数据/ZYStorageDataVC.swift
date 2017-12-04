//
//  ZYStorageDataVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/17.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class ZYStorageDataVC: UIViewController {

    let dataArr = [
        ["key":"OCViewController","function":"OC简单block、调用,跳转OC控制器未解决"],
        ["key":"JiaFaJiSuanQIVC","function":"加法计算器"],
        ["key":"MianXiangDuiXiangVC","function":"面向对象"],
        ["key":"KVC_VCViewController","function":"构造函数，KVC"],
        ["key":"YunXingShiVC","function":"运行时"],
        ["key":"HanShuDIngYIVC","function":"Swift最基本调用"],
        ["key":"GCDViewController","function":"GCD调用"],
        ["key":"XunHuanYInYongVC","function":"循环引用"],
        ["key":"JiaZaiBaiDuShuJuVC","function":"加载百度数据"],
        ["key":"JianDanGouZaoHanShuVC","function":"遍历构造函数"],
        ["key":"LanJiaZaiVC","function":"懒加载"],
        ["key":"JiSuanXinShuXinVC","function":"计算型属性"],
        ["key":"LiYongMoXingVC","function":"利用模型设置UI界面重写setter"],
        ["key":"ZYZiDingYiDaoHangLanVC","function":"自定义导航栏"],
        ["key":"FenLeiDiaoYongVC","function":"使用分类Extention"]
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 保存自定义数据为plist
        ZYDataOfPlistFromArray()
        // 保存自定义数据为Json
        ZYDataOfJsonFromArray()
        // 解析bundle Json数据
        ZYDataOfJsonFromBundle()
        // 数组转化为Json数据
        parsingPlistOfData()
        
        // 保存数据到沙盒
        loadJsonInfo()
        // 从沙盒取出数据
        GetJsonInfo()
    }
    
    private func GetJsonInfo() {
        // 0. 获取沙盒 json 路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("test.json")
        
        // 加载 data
        var data = NSData(contentsOfFile: jsonPath)
        
        // 判断 data 是否有内容，如果没有，说明本地沙盒没有文件
        if data == nil {
            // 从 Bundle 加载 data
            let path = Bundle.main.path(forResource: "test.json", ofType: nil)
            
            data = NSData(contentsOfFile: path!)
        }
        
        // data 一定会有一个内容，反序列化
        // 反序列化转换成数组
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]]
            else {
                return
        }
        print("获取数据： \(array)")
    }
    
    private func loadJsonInfo() {
        
        // 1. 模拟异步
        DispatchQueue.global().async {
            
            // 1> url
            let url = Bundle.main.url(forResource: "test.json", withExtension: nil)
            
            // 2> data
            let data = NSData(contentsOf: url!)
            
            // 3> 写入磁盘
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonPath = (docDir as NSString).appendingPathComponent("test.json")
            
            // 直接保存在沙盒，等待下一次程序启动使用！
            data?.write(toFile: jsonPath, atomically: true)
            
            print("数据加载完毕 \(jsonPath)")
        }
    }

    
    private func ZYDataOfJsonFromArray() {
        // 转换数据为Json
        // prettyPrinted是表示用一个方便查看的格式 也可以是[]
        let data = try? JSONSerialization.data(withJSONObject: dataArr, options: [.prettyPrinted])
        print("转换数据Json + \(data)")
        // 将数据保存到桌面
        (dataArr as NSArray).write(toFile: "/Users/ylcf/Desktop/test.json", atomically: true)
    }
    
    private func ZYDataOfJsonFromBundle() {
        guard let path  = Bundle.main.path(forResource: "test.json", ofType: nil),
        let data = NSData(contentsOfFile: path),
        let array = try? JSONSerialization.jsonObject(with: data as Data, options: [])
            else {
            print("不存在测试的json数据")
            return
        }
        print("测试Bundle的json数据 + \(array)")
    }
    
    private func parsingPlistOfData() {
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: -功能实现
extension ZYStorageDataVC {
    // 保存自定义数据为plist
    func ZYDataOfPlistFromArray() {
        // 将数组强转 然后使用OC方法写入桌面
        (dataArr as NSArray).write(toFile: "/Users/ylcf/Desktop/test.plist", atomically: true)
    }
}
