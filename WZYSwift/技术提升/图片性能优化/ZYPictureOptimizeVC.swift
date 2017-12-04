//
//  ZYPictureOptimizeVC.swift
//  WZYSwift
//
//  Created by ylcf on 17/3/23.
//  Copyright © 2017年 wzy. All rights reserved.
//

/*
    1.选中图片 点击顶部dubug - color blended layers混合模式  红色的是不透明的(默认true)  绿色的是透明的false 不透明好
    2.color misaligned images
    2.主要解释：印象笔记-swift学习-“图片性能检测-swift”
 */
/*
    png图片是支持透明的，常识
    jpg图片不支持透明
 */
import UIKit

class ZYPictureOptimizeVC: UIViewController {

    
    @IBOutlet weak var iconImagView: UIImageView!
    
    @IBOutlet weak var avatarImagView: UIImageView!
    
    @IBOutlet weak var iconImgV: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupPictureOptimize()
    }
    // 设置图片
    private func setupPictureOptimize() {
        iconImagView.image = #imageLiteral(resourceName: "test.png")
        
        // 优化
        let img = #imageLiteral(resourceName: "test.png")
        
        
        avatarImagView.image = avatarImag(imag: img, size: avatarImagView.bounds.size, backCoor: view.backgroundColor)
        // 备注：xib加载的图像不能设置 设置以后无用暂时不知道解决办法3333
        let imagView = UIImageView(frame: CGRect(x: 210, y: 210, width: 100, height: 100))
        imagView.image = avatarImag(imag: img, size: imagView.bounds.size, backCoor: view.backgroundColor)
        view.addSubview(imagView)
        
    }
    // 将给定的图像进行拉伸，并且返回“新的图像”
    // ？ 是设置返回值 为可选  否则需要强行解包
    // 调用这个函数cpu会消耗大一点 但是GPU消耗会少很多 cpu消耗后就不管了 而gpu是消耗是一直计算
    private func avatarImag(imag: UIImage,size: CGSize,backCoor: UIColor?) -> UIImage? {
        // CGPoint设置为0，0 写法 CGPoint()；CGSize一样
        let rect = CGRect(origin: CGPoint(), size: size)
        
         //1.图像的上下文 - 内存中开辟一个地址，跟屏幕无关
        /*
         参数：
         1、size： 绘图的尺寸
         2、false(透明) / true (不透明)
         3、scale：屏幕分辨率，默认生成的图像默认使用 1.0分辨率，图像质量不好。可以指定为0，会选择当前设备的屏幕分辨率
         */
        UIGraphicsBeginImageContextWithOptions(size, true, 0)
        //1> 背景填充
        backCoor?.setFill()
        UIRectFill(rect)
        //2> 实例化一个圆形的路径
        let path = UIBezierPath(ovalIn: rect)
        //3> 进行路径裁切 - 后续的绘图，都会出现在圆形路径内部 外部的全部干掉
        path.addClip()
        //3>
        
        // 2、绘图 drawInRect 就是指定区域内拉伸屏幕
        imag.draw(in: rect)
        
        // 6、最后加上边线
        UIColor.darkGray.setStroke()
        path.lineWidth = 2// 设置边线粗细
        path.stroke()
        //  3、取得结果
        let resut = UIGraphicsGetImageFromCurrentImageContext()
        //  4、关闭上下文
        UIGraphicsEndImageContext()
        //  5、返回结果
            return resut
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


