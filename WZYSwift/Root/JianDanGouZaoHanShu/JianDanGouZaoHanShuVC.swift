//
//  JianDanGouZaoHanShuVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/16.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class JianDanGouZaoHanShuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let p = JDGZHSPerson(name: "wzy", age: 20)
        print(p?.name)
        
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
