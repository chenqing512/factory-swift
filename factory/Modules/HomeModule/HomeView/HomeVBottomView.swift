//
//  HomeVBottomView.swift
//  factory
//
//  Created by Qing Chen on 2018/6/5.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class HomeVBottomView: UIView {
    ///大V昵称
    var labName = UILabel()
    
    /// 大V介绍
    var labDetail = UILabel()
    let icon = UIImageView()
    
    /// 价格
    var labPrice = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    var _vModel: BigVModel?
    var vModel: BigVModel?{
        get{
            return _vModel
        }
        set{
            _vModel = newValue
            labName.text = _vModel?.nickname
            labDetail.text = _vModel?.topic
            let price = (_vModel?.vcoinPerMinute?.description)!+"V币/分钟"
            labPrice.text = price
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView(){
        labName.textColor = UIColor.colorWithHexString(stringToConvert: "ffffff")
        labName.font = UIFont.systemFont(ofSize: 15)
        labName.textAlignment = .left;
        labName.text = "帅帅帅"
        addSubview(labName)
        labName.snp.makeConstraints { (make) in
            make.left.equalTo(14)
            make.bottom.equalTo(self.snp.bottom).offset(-32)
        }
        
        
        labDetail.textColor = UIColor.colorWithHexString(stringToConvert: "ffffff")
        labDetail.font = UIFont.systemFont(ofSize: 12)
        labDetail.textAlignment = .left
        labDetail.text = "帅帅帅的个人介绍"
        addSubview(labDetail)
        labDetail.snp.makeConstraints { (make) in
            make.left.equalTo(labName.snp.left)
            make.top.equalTo(labName.snp.bottom).offset(11)
        }
        labPrice.textColor = UIColor.colorWithHexString(stringToConvert: "ffffff")
        labPrice.font = UIFont.systemFont(ofSize: 12)
        labPrice.textAlignment = .right;
        labPrice.text = "8V币/分钟"
        addSubview(labPrice)
        labPrice.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.right).offset(-14)
            make.bottom.equalTo(self.snp.bottom).offset(-10)
        }
        addSubview(icon)
        icon.image = UIImage(named: "home_video")
        icon.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 14, height: 9))
            make.right.equalTo(labPrice.snp.left).offset(-5)
            make.centerY.equalTo(labPrice.snp.centerY)
        }
    }

}
