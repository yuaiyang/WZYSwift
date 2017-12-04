//
//  FenLeiDiaoYongVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/16.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class FenLeiDiaoYongVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 使用分类创建一个UITextField
        setupUI()
    
    }
    
    func setupUI() -> () {
        let tf = UITextField(frame: CGRect(x: 20, y: 60, width: 30, height: 30), placeholder: "0", fontSize: 10)
        view.addSubview(tf)
        
        let tf1 = UITextField(frame: CGRect(x: 20, y: 100, width: 30, height: 30), placeholder: "0", fontSize: 12)
        view.addSubview(tf1)
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
