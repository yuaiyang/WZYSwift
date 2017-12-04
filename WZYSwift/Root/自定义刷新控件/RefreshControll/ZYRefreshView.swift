//
//  ZYRefreshView.swift
//  refreshC
//
//  Created by ylcf on 2017/4/20.
//  Copyright © 2017年 ylcf. All rights reserved.
//  刷新视图 负责刷新 UI 显示和动画

import UIKit


class ZYRefreshView: UIView {
    
    // 刷新状态属性 枚举 使用set方法赋值
    var refreshState: ZYRefreshState = .Normal {
        didSet {
            switch refreshState {
            case .Normal:
                // 恢复状态
                tipIcon.isHidden = false
                tipIndicator.stopAnimating()
                
                tipLabel.text = "继续使劲啦..."
                UIView.animate(withDuration: 0.25, animations: {
                    // 恢复以前的视图
                    self.tipIcon.transform = CGAffineTransform.identity
                })
            case .Pulling:
                tipLabel.text = "放手就刷新..."
                UIView.animate(withDuration: 0.25, animations: {
                    // 尾随闭包
                    // 旋转
                    // (M_PI - 0.001)的目的是为了反方向旋转 系统的就近原则使用
                    self.tipIcon.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI - 0.001))
                })
                
            case .WillRefresh:
                tipLabel.text = "正在刷新中..."
                tipIcon.isHidden = true
                // 显示加载视图
                tipIndicator.startAnimating()
            }
        }
    }
    

    // 提示图标
    @IBOutlet weak var tipIcon: UIImageView!
    // 提示标签
    @IBOutlet weak var tipLabel: UILabel!
    // 指示器
    @IBOutlet weak var tipIndicator: UIActivityIndicatorView!
    
    class func refreshView() -> ZYRefreshView {
        let nib = UINib(nibName: "ZYRefreshView", bundle: nil)
        // 注意这里需要强转一下
        return nib.instantiate(withOwner: nil, options: nil)[0] as! ZYRefreshView
        
    }
    
    

}
