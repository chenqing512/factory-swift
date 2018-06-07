//
//  HomeTitleCollectionViewCell.swift
//  factory
//
//  Created by Qing Chen on 2018/6/5.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import SnapKit
class HomeTitleCollectionViewCell: UICollectionViewCell {
    
    var titleLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func layoutView(){
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.colorWithHexString(stringToConvert: "505050")
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    open func updateTitle(dict: [String: Any]){
        titleLabel.text = dict["title"] as? String
    }
}
