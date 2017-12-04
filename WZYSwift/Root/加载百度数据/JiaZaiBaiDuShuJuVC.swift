//
//  JiaZaiBaiDuShuJuVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/16.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class JiaZaiBaiDuShuJuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 声明一个URL
        let url = URL(string: "https://www.tmall.com")
        // 发起网路请求
        // 和OC区别，闭包所有参数都需要自己写，OC是直接带入 
        // 如果是不关心的参数可以直接 _ 忽略
        URLSession.shared.dataTask(with: url!) { (data, _, error) in
//            if (error != nil) {
//                return
//            }
            guard let data = data else {
                print("数据请求失败 \(error?.localizedDescription)")
                return
            }
            print("请求二进制数据 \(data)")
            
            // 将data转换为 String
            let htmlData = String(data: data, encoding: .utf8)
            print("请求中文数据 \(htmlData)")
        }.resume()
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
