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


//MARK

let kWG_NOTIFICATION_ACCOUNT_LOGIN_OTHER = "kWG_NOTIFICATION_ACCOUNT_LOGIN_OTHER"  //其它设备上登录
let kWG_NOTIFICATION_ACCOUNT_LOGOUT = "kWG_NOTIFICATION_ACCOUNT_LOGOUT"      //退出登录
let kWG_NOTIFICATION_ACCOUNT_LOGIN_SUCCESS = "kWG_NOTIFICATION_ACCOUNT_LOGIN_SUCCESS"    //登录成功


class WGUtil: NSObject {
    //MARK 获取屏幕宽高
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
    class func setWindowRootVC(vc: UIViewController, animated: Bool){
        
        let oldRootVC = UIApplication.shared.keyWindow?.rootViewController;
        if animated {
            UIView.transition(from: (oldRootVC?.view)!, to: vc.view, duration: 0.5, options: [UIViewAnimationOptions.curveEaseOut, UIViewAnimationOptions.transitionCrossDissolve], completion: { (finished) in
                UIApplication.shared.keyWindow?.rootViewController = vc;
            })
        }else{
            UIApplication.shared.keyWindow?.rootViewController = vc;
        } 
    
    }
    //MARK 文件上传
    class func createUplaodFileName(userID: Int)->(String){
        let time =  NSDate().timeIntervalSince1970;
        let scope = "0123456789abcdefghijklmnopqrstuvwxyz";
        var scopeString = "\(userID)_\(time)_"
        for  _ in 0 ..< 20{
            let index = arc4random() % UInt32(scope.count);
            let str = scope[scope.index(scope.startIndex, offsetBy: String.IndexDistance(index))]
            scopeString.append(str)
        }
        return scopeString;
    }
    
    class func createUploadCallBackBody(sn: Int, fileName: String, fileType: String, voiceTimeLen: Int, videoLength:Int, videoCoverID: Int, videoWidth: Int, videoHeight: Int, albumId: Int, askID: Int)->String{
        let callbackBody = "userID=\(SharedData.user?.userId)&userKey=\(SharedData.user?.userKey)&sn=\(sn)&fileName=\(fileName)&fileType=\(fileType)&voiceLength=\(voiceTimeLen)&videoLength=\(videoLength)&videoCoverID=\(videoCoverID)&videoWidth=\(videoWidth)&videoHeight=\(videoHeight)&albumID=\(albumId)&askID=\(askID)&isIOS=1&bucket=${bucket}&object=${object}&etag=${etag}&size=${size}&mimeType=${mimeType}&imageInfo.height=${imageInfo.height}&imageInfo.width=${imageInfo.width}&imageInfo.format=${imageInfo.format}&appName=showmay";
        return callbackBody;
    }
 
    class func pathDocument()->String{
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                        FileManager.SearchPathDomainMask.userDomainMask, true);
        return (paths.first)!;
    }
    
    /// 获取当前系统名称
    ///
    /// - Returns: 系统名称
    class func getsystemName()->String{
        return UIDevice.current.systemName;
    }
    
    /// 获取当前系统版本号
    ///
    /// - Returns: 系统版本号
    class func getsystemVersion()->String{
        return UIDevice.current.systemVersion;
    }
    
    /// APP版本号
    ///
    /// - Returns: APP版本号
    class func getAPPVersion()->String{
        return Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String;
    }
    
    /// iphone 名称
    ///
    /// - Returns: iPhone 名称
    class func getIphoneName()->String{
        return UIDevice.current.name;
    }
    
    /// Build 号
    ///
    /// - Returns: Build 号
    class func getBuild()->String{
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String;
    }

}













