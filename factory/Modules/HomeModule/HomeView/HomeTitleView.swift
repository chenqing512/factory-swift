//
//  HomeTitleView.swift
//  factory
//
//  Created by Qing Chen on 2018/6/2.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

protocol HomeTitleDelegate {
    func selectTitleIndex(index: Int)
}

class HomeTitleView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
//    typealias ButtonClick = (String) -> Void
//
//    var buttonClick: ButtonClick?
    var _titles: Array<Any>?
    var titles: Array<Any>? {
        get{
            return _titles
        }
        set{
            _titles = newValue
            layoutView()
            createLineView()
        }
    }
    var _selectIndex: Int?
    /// 选中的index
    var selectIndex: Int?{
        get{
            return _selectIndex
        }
        set{
            _selectIndex = newValue
            if lastIndex != _selectIndex {
                lastIndex = _selectIndex
                lineView.frame.origin.x = CGFloat(itemWidth*_selectIndex!)
            }
        }
    }
    /// 上次选中的index
    var lastIndex: Int?
    var collectionView: UICollectionView?
    var lineView = UIView()  //底部线条
    var itemWidth = 0
    var delegate: HomeTitleDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        itemWidth = Int(self.frame.size.width) / titles!.count
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
        let dic = titles![indexPath.row] as? [String: Any]
        cell.titleLabel.text = dic!["name"] as? String
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles!.count
    }
    
    
    func createLineView(){
        lineView.backgroundColor = UIColor.red
        lineView.layer.cornerRadius = 1.5
        lineView.layer.masksToBounds = true;
        lineView.frame = CGRect(x: 0, y: Int(self.frame.size.height-3), width: itemWidth, height: 3);
        addSubview(lineView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if delegate != nil {
            delegate?.selectTitleIndex(index: indexPath.row)
        }
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
