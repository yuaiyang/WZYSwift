//
//  ChongZaiJChStudent.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/13.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class ChongZaiJChStudent: ChongZaiPerson {
    var number: String
    init(name: String, number: String) {
        self.number = number
        // 调用父类方法，给name初始化
        super.init(name: name)
    }
    
}
