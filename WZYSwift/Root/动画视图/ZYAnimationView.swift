

//
//  ZYAnimationView.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/17.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class ZYAnimationView: UIView {

    // MARK: - 私有控件
    /// 懒加载属性只有调用 UIKit 控件的指定构造函数，其他都需要使用类型
    /// 图像视图
    lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "test"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - 设置界面
extension ZYAnimationView {
    func setupUI() {
        // 1. 添加控件
        addSubview(iconView)
        
        // 2. 取消 autoresizing
        for v in subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // 3. 自动布局
        // 1> 图像视图
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: -60))
        // 将其变圆
        // 3. 设置圆角(iconView的 bounds 还没有设置)
        iconView.layer.cornerRadius = iconView.bounds.size.width * 0.5
        iconView.layer.masksToBounds = true
        // 启动动画
        startAnimation()
    }
    
    // 旋转视图动画
    private func startAnimation() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 旋转角度
        anim.toValue = 2 * M_PI
        // 让其一直旋转
        anim.repeatCount = MAXFLOAT
        // 旋转一圈的时间
        anim.duration = 15
        
        // 动画完成不删除，如果 iconView 被释放，动画会一起销毁！
        // 在设置连续播放的动画非常有用！
        anim.isRemovedOnCompletion = false
        
        // 将动画添加到图层
        iconView.layer.add(anim, forKey: nil)
    }
}
