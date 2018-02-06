//
//  ViewController.swift
//  SwiftText
//
//  Created by Macbook on 2018/1/11.
//  Copyright © 2018年 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib;
        print(MySum(num: 1, num2: 2))
        
        let MyString = "zdd"
        print(MyString)
        
        show(text:"swift竟然不用倒入头文件竟然不用最后；语法完全变成了#pragma mark ===========注释========== 哈哈哈哈,实现起来真的好麻烦啊" )
    }
    func MySum(num:NSInteger,num2:NSInteger) -> NSInteger {
        return num+num2;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController
{
    func show(text:String) {
        self.view.showview(text)
    }
}


