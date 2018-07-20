//
//  WGEmptyView.swift
//  factory
//
//  Created by Qing Chen on 2018/7/14.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class WGEmptyView: UIView {
    
    let img = UIImageView()
    let titleLab = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        backgroundColor = UIColor.colorWithHexString(stringToConvert: "f6f7f9")
        layoutView()
    }
    
    func layoutView(){
        img.image = UIImage(named: "refresh")
        addSubview(img)
        img.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-15)
            make.height.width.equalTo(20)
        }
        
        addSubview(titleLab)
        titleLab.text = "正在加载中..."
        titleLab.font = UIFont.systemFont(ofSize: 12)
        titleLab.textColor = #colorLiteral(red: 0.7333333333, green: 0.7333333333, blue: 0.7333333333, alpha: 1)
        titleLab.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(12)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

