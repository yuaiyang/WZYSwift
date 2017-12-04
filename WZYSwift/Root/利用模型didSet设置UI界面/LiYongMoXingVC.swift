//
//  LiYongMoXingVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/14.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class LiYongMoXingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let p = LiYongMoXingPerson()
        p.name = "花花公子"
        let label = LiYOngMoXingLabel(frame: CGRect(x: 20, y: 40, width: 100, height: 40))
        view.addSubview(label)
        
        // 将模型设置给label
        label.person = p
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
