//
//  BigVModel.swift
//  factory
//
//  Created by Qing Chen on 2018/6/9.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import Foundation
import HandyJSON

struct BigVModel: HandyJSON {
    var avatar: WGAvatar?
    var id: Int?
    var isOneFree: Bool?
    var level: Int?
    var nickname: String?
    var online: Int?
    var topic: String?
    var vcoinPerMinute: Int?
}
