//
//  DiscoverItemView.swift
//  factory
//
//  Created by ChenQing on 2018/6/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class DiscoverItemCollectionCell: UICollectionViewCell {
    
    var _videoModel: VideoModel?
    var videoModel: VideoModel?{
        get{
            return _videoModel
        }
        set{
            _videoModel = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
