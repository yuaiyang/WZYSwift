//
//  UIButton+Extention.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/16.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

extension UIButton {
    convenience init(frame: CGRect,title: String) {
        self.init(frame: frame)
        self.setTitle(title, for: .normal)
    }
}
