//
//  ZYAnimatedImagVc.swift
//  WZYSwift
//
//  Created by ylcf on 2017/4/20.
//  Copyright © 2017年 wzy. All rights reserved.
//

import UIKit

class ZYAnimatedImagVc: UIViewController {

    @IBOutlet weak var animationImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let imag1 = #imageLiteral(resourceName: "refresh_1.png")
        let imag2 = #imageLiteral(resourceName: "refresh_2.png")
        let imag3 = #imageLiteral(resourceName: "refresh_3.png")
        let imag4 = #imageLiteral(resourceName: "refresh_4.png")
        
        
        animationImageView.image = UIImage.animatedImage(with: [imag1,imag2,imag3,imag4], duration: 0.5)
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
