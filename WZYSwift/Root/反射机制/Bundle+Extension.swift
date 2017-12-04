//
//  Bundle+Extension.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/14.
//  Copyright © 2017年 wzy. All rights reserved.
//

import Foundation

extension Bundle {
    /*
     // 返回命名空间字符串
     func namespace() -> String {
     //        return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
     // 因为对象函数就是mainBundle 所以可以省略
     return infoDictionary?["CFBundleName"] as? String ?? ""
     }
     */
    // 计算型属性类似于函数 没有参数 有返回值
    var namespace: String {
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
