//
//  WGUtil.swift
//  factory
//
//  Created by Qing Chen on 2018/5/9.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

#if DEBUG
public var kHttpHost = "http://sh.pairui6.com/"  // 域名
public var kPUSH_ACCOUNT = "smkj_test"  // push count
#else
public var kHttpHost = "http://sh.pairui6.com/"  // 域名
public var kPUSH_ACCOUNT = "smkj_test"  // push count
#endif
public let kLoadingTime = 1.5
public let kLoading = "kLoading"  // 网络请求是否有loading

class WGUtil: NSObject {
    
    ///屏幕宽度
    ///
    /// - Returns: 宽
    class func screenHeight()->(CGFloat){
        return UIScreen.main.bounds.size.height;
    }
    /// 屏幕高度
    ///
    /// - Returns: 高
    class func screenWidth()->(CGFloat){
        return UIScreen.main.bounds.size.width;
    }
    
    /// 创建线条
    ///
    /// - Returns: view
    class func createLine()->(UIView){
        let view = UIView();
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1);
        return view;
    }
    class func createUplaodFileName(userID: Int)->(String){
        let scope = "0123456789abcdefghijklmnopqrstuvwxyz";
        var scopeString = "\(userID)_\()|"
    }

}
