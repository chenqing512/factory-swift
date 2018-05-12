//
//  WGSharedMacr.swift
//  factory
//
//  Created by Qing Chen on 2018/5/10.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

let SharedMacr = WGSharedMacr.shared

class WGSharedMacr: NSObject {
    
    /// 当前服务器url
    var currentServerUrl: String?
    
    /// osss上传路径
    var upLoadFilePath: String?
    var pushAccount: String?
    var nimServiceUserId: String?
    var ossCallback: String?
    var ossDomain: String?
    var ossBucket: String?
    var OnlineServer: String?
    static let shared = WGSharedMacr()
    private override init() {}
    override func copy() -> Any {
        return self;
    }
    override func mutableCopy() -> Any {
        return self;
    }
}
