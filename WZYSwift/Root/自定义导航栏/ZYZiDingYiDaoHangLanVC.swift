//
//  ZYZiDingYiDaoHangLanVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/16.
//  Copyright © 2017年 wzy. All rights reserved.
//

// 自定义导航条以后 侧滑效果会失效 同时设置界面时需要考虑顶部

import UIKit

let SCREENW = UIScreen.main.bounds.width
let SCREENH = UIScreen.main.bounds.height


class ZYZiDingYiDaoHangLanVC: UIViewController {
    
    // 自定义导航栏
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: SCREENW, height: 64))
    // 自定义导航条目
    lazy var navItem = UINavigationItem()
    
    
    override func loadView() {
        super.loadView()
        // 隐藏导航栏
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    // 重写UINavigationItem的didSet(setter)方法设置标题
    // 注意didSet没有提示
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
    
    func didClickBack()  {
        navigationController?.popViewController(animated: true)
    }
    
    func didClickNext()  {
        navigationController?.pushViewController(ZYZDYDHLTiaoZhuanVC(), animated: true)
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.red
        // 添加导航条
        view.addSubview(navigationBar)
        // 将item添加到导航条
        navigationBar.items = [navItem]
        // 设置navBar的渲染颜色
        navigationBar.barTintColor = UIColor.init(red: 246, green: 246, blue: 246, alpha: 0)
        // 设置navBar的字体颜色
        navigationBar.tintColor = UIColor.red
        // 给导航栏item设置按钮
        navItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(didClickBack))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "跳转", style: .plain, target: self, action: #selector(didClickNext))
    }
}


