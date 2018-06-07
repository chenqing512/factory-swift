//
//  HomeDetailCell.swift
//  factory
//
//  Created by Qing Chen on 2018/6/5.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class HomeDetailCell: UITableViewCell{
    
    /// 背景图片
    var imgViewBg: UIImageView?
    
    /// 在线状态
    var imgViewState: UIImageView?
    
    let vBottomView = HomeVBottomView(frame: CGRect.zero)
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.gray
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView(){
        imgViewBg = UIImageView()
        addSubview(imgViewBg!)
        imgViewBg?.snp.makeConstraints({ (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        })
        addSubview(vBottomView)
        vBottomView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(frame.size.height-100, 0, 0, 0))
        }
    }
}
