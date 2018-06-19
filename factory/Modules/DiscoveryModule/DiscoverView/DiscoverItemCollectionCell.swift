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
            backgroundImg?.sd_setImage(with: URL(string: (_videoModel?.cover?.url)!), placeholderImage: UIImage(named:"default_avatar.jpg"), options: [], completed: nil)
            lblContent?.text = _videoModel?.title
            lblName?.text = _videoModel?.nickname
            lblNums?.text = _videoModel?.follow?.description
            avatarImg?.sd_setImage(with: URL(string: (_videoModel?.avatar?.url)!), placeholderImage: UIImage(named:"default_avatar.jpg"), options: [], completed: nil)
        }
    }
    
    var backgroundImg: UIImageView?
    var lblContent: UILabel?
    var avatarImg: UIImageView?
    var lblName: UILabel?
    var iconImg: UIImageView?
    var lblNums: UILabel?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.red
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView(){
        backgroundImg = UIImageView(frame: CGRect.zero)
        addSubview(backgroundImg!)
        backgroundImg?.snp.makeConstraints({ (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        })
        lblContent = UILabel(frame: CGRect.zero)
        lblContent?.font = UIFont.systemFont(ofSize: 12)
        lblContent?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        backgroundImg!.addSubview(lblContent!)
        lblContent?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(5)
            make.bottom.equalTo(-42)
        })
        
        avatarImg = UIImageView(frame: CGRect.zero)
        avatarImg?.layer.cornerRadius = 13.5
        avatarImg?.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        avatarImg?.layer.borderWidth = 1
        avatarImg?.layer.masksToBounds = true
        backgroundImg!.addSubview(avatarImg!)
        avatarImg?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(27)
            make.left.equalTo(5)
            make.bottom.equalTo(-5)
        })
        
        lblName = UILabel(frame: CGRect.zero)
        lblName?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lblName?.font = UIFont.systemFont(ofSize: 12)
        backgroundImg!.addSubview(lblName!)
        lblName?.snp.makeConstraints({ (make) in
            make.left.equalTo((avatarImg?.snp.right)!).offset(5)
            make.centerY.equalTo((avatarImg?.snp.centerY)!)
        })
        
        iconImg = UIImageView(image: UIImage(named: "video_heart"))
        backgroundImg!.addSubview(iconImg!)
        iconImg?.snp.makeConstraints({ (make) in
            make.width.height.equalTo(15)
            make.bottom.equalTo(-10)
            make.right.equalTo(-42)
        })
        
        lblNums = UILabel(frame: CGRect.zero)
        lblNums?.font = UIFont.systemFont(ofSize: 12)
        lblNums?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        backgroundImg!.addSubview(lblNums!)
        lblNums?.snp.makeConstraints({ (make) in
            make.left.equalTo((iconImg?.snp.right)!).offset(7)
            make.centerY.equalTo((iconImg?.snp.centerY)!)
        })
        
    }
    
}
