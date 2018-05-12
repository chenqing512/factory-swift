//
//  WGShare.swift
//  factory
//
//  Created by Qing Chen on 2018/5/10.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class WGShare: NSObject {
    
    /// 微博 title
    var weiboTitle: String?
    /// 微博 描述
    var weiboIntroduction: String?
    /// 微信 title
    var wechatTitle: String?
    /// 微信 描述
    var wechatIntroduction: String?
    /// qq title
    var qqTitle: String?
    /// qq 描述
    var qqIntroduction: String?
    /// imageUrl
    var imageUrl: String?
    var wechatBrowseUrl: String?
    var nonWechatBrowseUrl: String?
    var shareUrl: String?
    
    var type: Int?
    var albumID: Int?
}
