//
//  VideoModel.swift
//  factory
//
//  Created by Qing Chen on 2018/6/14.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import Foundation
import HandyJSON

struct VideoModel: HandyJSON{
    
    /// 视频ID
    var id: Int? 
    
    /// 上传视频的大Vid
    var posterId: Int?
    
    /// 上传视频的大V昵称
    var nickname: String?
    
    /// 上传视频的大V图像
    var avatar: WGAvatar?
    
    /// 视频标题
    var title: String?
    
    /// 视频上传的时间
    var postTime: String?
    
    /// 点赞次数
    var follow: Int?
    
    /// 小视频封面
    var cover: WGAvatar?
    
    /// 视频第一帧图像
    var frame: WGAvatar?
    
    /// 状态 1 通过 0 审核
    var states: Int?
}
