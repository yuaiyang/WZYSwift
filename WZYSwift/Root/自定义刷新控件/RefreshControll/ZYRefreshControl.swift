//
//  ZYRefreshControl.swift
//  refreshC
//
//  Created by ylcf on 2017/4/20.
//  Copyright © 2017年 ylcf. All rights reserved.
//  刷新控件 - 负责刷新相关的逻辑处理

import UIKit

/// 刷新状态临界点
private let ZYRefreshOffset: CGFloat = 60

/// 枚举


/// 刷新状态
///
/// - Normal: 普通 什么也不做
/// - Pulling: 超过临界点 放手开始刷新数据
/// - WillRefresh: 用户查过临界点 且放手
enum ZYRefreshState {
    case Normal
    case Pulling
    case WillRefresh
}

class ZYRefreshControl: UIControl {

    // MARK: 属性
    /// 刷新控件的父视图，下拉刷新控件应该适用于 UITanbleView和UICnllectionView
    // 用weak是为了防止循环引用
    private weak var scrollView: UIScrollView?
    
    // 布局 刷新视图
    lazy var refreshView: ZYRefreshView = ZYRefreshView.refreshView()
    
    // MARK: 构造函数
    init() {
        super.init(frame: CGRect())
        // 设置UI
        setUpUI()
    }
    
    // 在使用XIb的时候会使用这个方法加载视图 因此也需要设置视图UI
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // 设置UI
        setUpUI()
    }
    
    /*
     willMove 这个方法
     - 当添加到父视图的时候 newSuperview就是父视图
     - 当父视图消失的时候 newSuperview就是 nil
     */
    override func willMove(toSuperview newSuperview: UIView?) {
        // 判断父视图的类型
        guard let sv = newSuperview as? UIScrollView else {
            return
        }
        // 记录父视图
        scrollView = sv
        // KVO监听父视图的 contentOffset
        // KVO要监听的对象负责添加监听者
        // 在程序中通常只监听某一个对象的某几个属性方法，如果属性太多，方法会很乱
        // 观察者模式在不需要的时候都需要释放
        // 通知中心：如果不释放，什么也不会发生，但是会内存泄漏，而且会重复注册
        // KVO 如果不释放 会崩溃
        scrollView?.addObserver(self, forKeyPath: "contentOffset", options: [], context: nil)
    }
    
    // 自身视图从父视图移除
    // 提示： 所有的下拉刷新框架都是监听视图的"contentOffset"
    // 所有的框架 KVO 监听实现思路都是这样的
    override func removeFromSuperview() {
        // 注意： 这里要在父类 前面调用 需要superview还存在
        superview?.removeObserver(self, forKeyPath: "contentOffset")
        super.removeFromSuperview()
        // 注意： 这里父类也不存在了
    }
    
    // 所有KVO方法会统一调用此方法
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        // contentOffset的Y值和contentInset的top有关
        guard let sv = scrollView else {
            return
        }
        // 初始高度应该是0
        let height = -(sv.contentInset.top + sv.contentOffset.y)
        
        if height < 0 {
            return
        }
        
        // 根据高度设置刷新控件的frame
        self.frame = CGRect(x: 0, y: -height, width: sv.bounds.width, height: height)
        
        // 判断临界点 - 只需要判断一次
        // isDragging表示在拖拽中
        if sv.isDragging {
            // 拖拽中
            if height > ZYRefreshOffset && (refreshView.refreshState == .Normal) {
                print("放手刷新")
                refreshView.refreshState = .Pulling
            } else if height <= ZYRefreshOffset && (refreshView.refreshState == .Pulling) {
                print("继续拉...")
                refreshView.refreshState = .Normal
            }
        } else {
            // 放手了
            if refreshView.refreshState == .Pulling {
                print("准备开始刷新")
                beginRefreshing()
                // 发送刷新数据控件
                sendActions(for: .valueChanged)
            }
        }
    }
    
    func beginRefreshing() {
        // 判断父视图
        guard let sv = scrollView else {
            return
        }
        // 判断是否正在刷新，如果正在刷新 直接返回
        if refreshView.refreshState == .WillRefresh {
            return
        }
        // 刷新视图状态
        // 刷新结束之后 将状态更改为。Mormal 才能继续响应刷新
        refreshView.refreshState = .WillRefresh
        // 让整个视图可以显示
        // 解决办法：修改表格的 contentInset
        var inset = sv.contentInset
        inset.top += ZYRefreshOffset
        sv.contentInset = inset
    }
    
    func endRefreshing() {
        guard let sv = scrollView else {
            return
        }
        // 判断是否正在刷新，如果不是正在刷新 直接返回
        if refreshView.refreshState != .WillRefresh {
            return
        }
        // 恢复刷新视图的状态
        refreshView.refreshState = .Normal
        // 恢复表格视图的contentInset
        var inset = sv.contentInset
        inset.top -= ZYRefreshOffset
        sv.contentInset = inset
    }
}


extension ZYRefreshControl {
    func setUpUI() {
//        backgroundColor = super.backgroundColor
        backgroundColor = UIColor.red
        // 设置超出边界不显示 这里按理说应该打开
//        clipsToBounds = true
        // 添加刷新视图
        // 新视图从xib加载 默认就是xib指定宽高
        addSubview(refreshView)
        
        // 自动布局 (代码自动布局) -> 设置xib控件自动布局 需要指定宽高约束
        refreshView.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: refreshView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))
//        addConstraint(NSLayoutConstraint(item: refreshView,
//                                         attribute: .bottom,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .bottom,
//                                         multiplier: 1.0,
//                                         constant: 0))
//        addConstraint(NSLayoutConstraint(item: refreshView,
//                                         attribute: .width,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .notAnAttribute,
//                                         multiplier: 1.0,
//                                         constant: refreshView.bounds.width))
//        addConstraint(NSLayoutConstraint(item: refreshView,
//                                         attribute: .height,
//                                         relatedBy: .equal,
//                                         toItem: self,
//                                         attribute: .notAnAttribute,
//                                         multiplier: 1.0,
//                                         constant: refreshView.bounds.height))
        
    }
}
