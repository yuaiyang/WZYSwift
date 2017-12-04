//
//  XunHuanYInYongVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/1/11.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class XunHuanYInYongVC: UIViewController {
    // 声明一个属性
    var completionCallBack:(() ->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 当闭包对self进行了copy，同时self对闭包引用 才会造成循环引用
        demo {
            print("看看")
            // 这句话应该就进行了循环引用1111111111
//            print(self.view)
        }
        
        
        //MARK: -解除循环引用，需要打断链条
        // 方法一： weak可能在bei
        weak var weakSelf = self
        demo1 {
            
            // weakSelf?.view 有延时不会崩溃 只是单纯发送方法
            // weakSelf!.view 有延时会崩溃 
            // ！解包用于需要计算，可选项不能直接参与计算
            print(weakSelf?.view ?? self)
            print(weakSelf!.view ?? self)
        }
        
        // 方法二：推荐使用 [weak self]表示{}内所有self都是弱引用，注意需要解包
        demo2 {[weak self] in
            print(self?.view ?? XunHuanYInYongVC())
        }
        // 方法三：知道就好 别用
        // [unowned self]表示{}中所有self都是assign的，不会强引用，如果对象释放，指针地址不会变化
        // 如果对象呗释放，继续调用会出现野指针问题
        
        // 测试 进来马上出去就会崩溃 进来一会在出去就不会崩溃
        demo2 {[unowned self] in
            print(self.view)
        }
    }

    func demo(completion:@escaping () ->()) -> () {
        // 使用属性记录闭包 ->self对闭包进行了引用
        completionCallBack = completion;
        
        DispatchQueue.global().async {
            
            for _ in 0...1000 {
               print("耗时操作")
            }
            
            DispatchQueue.main.async {
                // 回调
                completion();
            }
        }
        
    }
    
    func demo1(completion:@escaping () ->()) -> () {
        // 使用属性记录闭包 ->self对闭包进行了引用
        completionCallBack = completion;
        
        DispatchQueue.global().async {
            
            for _ in 0...1000 {
                print("耗时操作")
            }
            
            DispatchQueue.main.async {
                // 回调
                completion();
            }
        }
        
    }
    
    func demo2(completion:@escaping () ->()) -> () {
        // 使用属性记录闭包 ->self对闭包进行了引用
        completionCallBack = completion;
        
        DispatchQueue.global().async {
            
            for _ in 0...1000 {
                print("耗时操作")
            }
            
            DispatchQueue.main.async {
                // 回调
                completion();
            }
        }
        
    }
    
    
    func demo3(completion:@escaping () ->()) -> () {
        // 使用属性记录闭包 ->self对闭包进行了引用
        completionCallBack = completion;
        
        DispatchQueue.global().async {
            
            for _ in 0...1000 {
                print("耗时操作")
            }
            
            DispatchQueue.main.async {
                // 回调
                completion();
            }
        }
        
    }
    
    // MARK: -用于调试，看是否进行了循环引用，如果循环引用那么就不会调用这个方法 类似于OC dealloc方法
    // 如果页面没有调用这个方法，那么就进行了循环引用
    deinit {
        print("销毁自身")
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
