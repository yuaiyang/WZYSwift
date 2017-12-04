//
//  UITextField+Extention.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/16.
//  Copyright © 2017年 wzy. All rights reserved.
//

//import Foundation


import UIKit

extension UITextField {
    convenience init(frame:CGRect, placeholder: String, fontSize: CGFloat = 14) {
        // 实例化对象
        self.init(frame: frame)
        
        // 设置对象的属性值
        self.textAlignment = .center
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.font = UIFont.systemFont(ofSize: fontSize)
    }
}

