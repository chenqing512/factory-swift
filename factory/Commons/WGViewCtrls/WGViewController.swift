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
    @objc public func backButtonClick(btn: UIButton){
        navigationController?.popViewController(animated: true);
    }
    
    /// 右侧按钮点击事件
    ///
    /// - Parameter btn: btn
    @objc public func otherButtonClick(btn: UIButton){
        
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
        updateLabel();
        updateButton();
        leftButton?.isHidden = true;
        rightButton?.isHidden = true;
        
    }
    
    /// 添加title视图
    private func updateLabel(){
        labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 44));
        labelTitle?.text = "";
        labelTitle?.font = UIFont.systemFont(ofSize: 18);
        labelTitle?.textAlignment = NSTextAlignment.center;
        labelTitle?.backgroundColor = UIColor.clear;
        navigationItem.titleView?.frame = CGRect(x: 0, y: 0, width: 375, height: 44);
        navigationItem.titleView = labelTitle;
    }
    
    /// 添加左右导航栏按钮
    private func updateButton(){
        leftButton = UIButton(type: UIButtonType.custom);
        leftButton?.addTarget(self, action: #selector(backButtonClick(btn:)), for: UIControlEvents.touchUpInside);
        leftButton?.frame = CGRect(x: 0, y: 0, width: 45, height: 19);
        leftButton?.setImage(UIImage(named: "nav_back_btn"), for: UIControlState.normal);
        leftButton?.setImage(UIImage(named: "nav_back_btn"), for: UIControlState.selected);
        leftButton?.contentHorizontalAlignment = .left
        let leftItem = UIBarButtonItem(customView: leftButton!);
        navigationItem.leftBarButtonItem = leftItem;
        
        
        rightButton = UIButton(type: UIButtonType.custom);
        rightButton?.addTarget(self, action: #selector(otherButtonClick(btn:)), for: UIControlEvents.touchUpInside);
        rightButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15);
        rightButton?.frame = CGRect(x: 0, y: 2, width: 45, height: 25);
        rightButton?.setTitle("", for: UIControlState.normal);
        rightButton?.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right;
        rightButton?.setTitleColor(UIColor.colorWithHexString(stringToConvert: "2b364e"), for: .normal)
        let rightItem = UIBarButtonItem(customView: rightButton!);
        navigationItem.rightBarButtonItem = rightItem;
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
