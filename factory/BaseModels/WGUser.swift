//
//  WGUser.swift
//  factory
//
//  Created by Qing Chen on 2018/5/10.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import HandyJSON
struct WGUser: HandyJSON {
    var userKey: String?
    var phoneNumber: String?
    var nickName: String?
    var avatar: WGAvatar?
    var accid: String?
    var categoryId: String?
    var id: Int?
    var isNoDisturbing: Bool?
    var vcoinAmount: Int?
    
}
