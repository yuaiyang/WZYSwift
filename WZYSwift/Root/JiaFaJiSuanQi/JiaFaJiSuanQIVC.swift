//
//  JiaFaJiSuanQIVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/12.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class JiaFaJiSuanQIVC: UIViewController {
    
    var numText1: UITextField?
    var numText2: UITextField?
    var resultLable: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
    }
    
    func setUpUI() -> () {
        view.backgroundColor = UIColor.green
        
        let tf1 = UITextField(frame: CGRect(x: 20, y: 80, width: 100, height: 30))
        tf1.borderStyle = .roundedRect;
        view.addSubview(tf1)
        
        let tf2 = UITextField(frame: CGRect(x: 140, y: 80, width: 100, height: 30))
        tf2.borderStyle = .roundedRect;
        view.addSubview(tf2)
        
        // 记录属性
        numText1 = tf1
        numText2 = tf2
        
        let l1 = UILabel(frame: CGRect(x: 120, y: 20, width: 20, height: 30))
        l1.text = "+"
        l1.textAlignment = .center
        view.addSubview(l1)
        
        let l2 = UILabel(frame: CGRect(x: 240, y: 20, width: 20, height: 30))
        l2.text = "="
        l2.textAlignment = .center
        view.addSubview(l2)
        
        let l3 = UILabel(frame: CGRect(x: 240, y: 20, width: 60, height: 30))
        l3.text = "0"
        l3.textAlignment = .right
        view.addSubview(l3)
        
        
        resultLable = l3
        
        let btn = UIButton()
        btn.setTitle("计算", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.sizeToFit()
        btn.center = view.center
        btn.addTarget(self, action: #selector(calc), for: .touchUpInside)
        view.addSubview(btn)
        
        
        
    }
    
    
    func calc() -> () {
        print(#function)
        print("\(numText1?.text) \(numText2?.text)")
        // 将文本内容转换为数值
        // Int? 如果文本框内容不是数字 Int之后是nil
//        let num1 = Int((numText1?.text) ?? "")
        guard let num1 = Int((numText1?.text) ?? ""),let num2 = Int((numText2?.text) ?? "") else {
            print("必须是数字才能计算")
            return
        }
        
        print(num1)
//        resultLable?.text = "\(num1) + \(num2)"
        resultLable?.text = "\(num1 + num2)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
