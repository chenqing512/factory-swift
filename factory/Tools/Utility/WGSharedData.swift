//
//  WGSharedData.swift
//  factory
//
//  Created by Qing Chen on 2018/5/10.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit


let SharedData = WGSharedData.Shared

class WGSharedData: NSObject {
    var user: WGUser?
    static let Shared = WGSharedData();
    private override init() {}
    override func copy() -> Any {
        return self
    }
    override func mutableCopy() -> Any {
        return self
    }
}
