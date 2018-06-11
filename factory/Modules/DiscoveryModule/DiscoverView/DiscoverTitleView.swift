//
//  DiscoverTitleView.swift
//  factory
//
//  Created by Qing Chen on 2018/6/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

protocol DiscoverItemDelegate {
    func selectItemAtIndex(index: Int)
}

class DiscoverTitleView: UIView {
    var delegate: DiscoverItemDelegate?
    var segment: UISegmentedControl?
    var tits: [Any]?
    var lineV: UIView?
    convenience init(frame: CGRect, titles: [Any]){
        self.init(frame: frame)
        tits = titles
        layoutView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView(){
        segment = UISegmentedControl(items: tits)
        segment?.frame = self.bounds
        
        segment?.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.colorWithHexString(stringToConvert: "ff2e79"),NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)], for: .selected)
        segment?.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.colorWithHexString(stringToConvert: "303030"), NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)], for: .normal)
        segment?.tintColor = UIColor.clear
        segment?.selectedSegmentIndex = 1
        segment?.addTarget(self, action: #selector(segmentClickIndex(seg:)), for: .valueChanged)
        addSubview(segment!)
        
        lineV = UIView(frame: CGRect(x: 15+60, y: CGFloat((segment?.frame.size.height)!) - 7, width: 30, height: 3))
        lineV?.backgroundColor = UIColor.colorWithHexString(stringToConvert: "ff2e79")
        segment?.addSubview(lineV!)
    }
    
    @objc func segmentClickIndex(seg: UISegmentedControl){
        if delegate != nil {
            lineV?.frame.origin.x = CGFloat(seg.selectedSegmentIndex * 60) + 15
            print("点击\(seg.selectedSegmentIndex)")
            delegate?.selectItemAtIndex(index: seg.selectedSegmentIndex)
        }
        
    }
    
}
