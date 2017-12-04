//
//  ZYAnimationVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/17.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class ZYAnimationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ZYAnimationView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
