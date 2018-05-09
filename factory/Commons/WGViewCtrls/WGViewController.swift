//
//  WGViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/5/9.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class WGViewController: UIViewController {
    
    var labelTitle: UILabel?;
    var leftButton: UIButton?;
    var rightButton: UIButton?;
    
    // MARK: public 方法
    
    /// 返回按钮点击事件
    ///
    /// - Parameter btn: btn
    public func backButtonClick(btn: UIButton){
        
    }
    
    /// 右侧按钮点击事件
    ///
    /// - Parameter btn: btn
    public func otherButtonClick(btn: UIButton){
        
    }
    
    /// 获取tabbar 高度
    ///
    /// - Returns: tabbar高度
    public func tabBarHeight()->(CGFloat){
        return (tabBarController?.tabBar.frame.size.height)!;
    }
    // MARK: Lift Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    private func updateLabel(){
        labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 44));
        labelTitle?.text = "";
        labelTitle?.font = UIFont.systemFont(ofSize: 18);
        labelTitle?.textAlignment = NSTextAlignment.center;
        labelTitle?.backgroundColor = UIColor.clear;
        navigationItem.titleView?.frame = CGRect(x: 0, y: 0, width: 375, height: 44);
        navigationItem.titleView = labelTitle;
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
