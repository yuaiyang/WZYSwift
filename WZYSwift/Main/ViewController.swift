//
//  ViewController.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/5.
//  Copyright © 2017年 sgx. All rights reserved.
//  

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private var dataArr :Array = [["key":"OCViewController","function":"OC简单block、调用,跳转OC控制器未解决"]]

    override func viewDidLoad() {
        // 获取plist数据
        getDataForResource()
        
        // 设置tableView
        setUpUI()
    
    }
    // 注意：一般不会写，这里主要是由于有自定义导航栏 所以需要在返回时进行处理 其他控制器不管
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func getDataForResource() {
        guard let path = Bundle.main.path(forResource: "ViewControllersData", ofType: "plist") else {
            return
        }
        dataArr = (NSArray(contentsOfFile: path) as! Array)
    }
    
    private func setUpUI() -> () {
        let tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        view.addSubview(tableView)
        
        // 注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell_id")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell_id")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell_id")
        }
        
        let functionStr = dataArr[indexPath.row]["function"] ?? ""
        
        cell?.textLabel?.text = "跳转  " + functionStr
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcName: String = dataArr[indexPath.row]["key"] ?? ""
        
        // 跳转OC控制器
        if vcName == "OCViewController" {
            let vc = OCViewController()
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        guard let cls = NSClassFromString(Bundle.main.namespace + "." + vcName) as? UIViewController.Type
        else {
            let alertVc = UIAlertController(title: "提示", message: "没有这个控制器，请查看是否是OC控制器，暂未做跳转，或者是反射机制代码提取需要打开appDelegate使用代码控制主控制器才可以查看", preferredStyle: .alert)
            let action = UIAlertAction(title: "好吧！", style: .cancel, handler: nil)
            alertVc.addAction(action)
            navigationController?.present(alertVc, animated: true, completion: {
            })
            
            return
        }
        
        let vc = cls.init()
        navigationController?.pushViewController(vc, animated: true)
    }
    

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


