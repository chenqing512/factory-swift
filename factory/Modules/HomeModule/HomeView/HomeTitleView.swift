//
//  HomeTitleView.swift
//  factory
//
//  Created by Qing Chen on 2018/6/2.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class HomeTitleView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
//    typealias ButtonClick = (String) -> Void
//
//    var buttonClick: ButtonClick?
    var titles = Array<[String: Any]>()
    var collectionView: UICollectionView?
    var lineView = UIView()  //底部线条
    var itemWidth = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        titles.append(["title":"关注"])
        titles.append(["title":"推荐"])
        titles.append(["title":"新人"])
        titles.append(["title":"三星"])
        titles.append(["title":"四星"])
        titles.append(["title":"五星"])
        layoutView()
        createLineView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        itemWidth = Int(self.frame.size.width) / titles.count
        let itemHeight = self.frame.size.height - 5
        layout.itemSize = CGSize(width: CGFloat(itemWidth), height: itemHeight)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: WGUtil.screenWidth(), height: self.frame.size.height), collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.clear
        collectionView?.register(HomeTitleCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        addSubview(collectionView!)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! HomeTitleCollectionViewCell
//        cell.backgroundColor = UIColor.white
        let dic = titles[indexPath.row]
        cell.titleLabel.text = dic["title"] as? String
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func createLineView(){
        lineView.backgroundColor = UIColor.red
        lineView.layer.cornerRadius = 1.5
        lineView.layer.masksToBounds = true;
        lineView.frame = CGRect(x: 0, y: Int(self.frame.size.height-3), width: itemWidth, height: 3);
        addSubview(lineView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lineView.frame.origin.x = CGFloat(itemWidth*indexPath.row)
    }
    
    
    
    
    /*
    func setUpView(){
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 50)

        btn.setTitle("测试", for: .normal)
        btn.backgroundColor = UIColor.gray
        self.addSubview(btn)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
    }
    
    
    @objc func btnClick(){
        print("1234")
        if buttonClick != nil {
            buttonClick!("测试")
        }
    }
 */

}
