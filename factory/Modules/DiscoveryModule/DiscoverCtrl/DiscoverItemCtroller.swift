//
//  DiscoverItemCtroller.swift
//  factory
//
//  Created by ChenQing on 2018/6/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class DiscoverItemCtroller: WGViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    lazy var collectiV: UICollectionView = {
        let width = (WGUtil.screenWidth() - 5)/2
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: width, height: width*276/187)
        layout.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0)
        layout.scrollDirection = .vertical
        let collectiView: UICollectionView  = UICollectionView(frame: CGRect(x: 0,y: 0,width:WGUtil.screenWidth() ,height:WGUtil.screenHeight() - SharedData.tabBarHeight - WGUtil.statusBarHeight() - 44), collectionViewLayout: layout)
        collectiView.backgroundColor = UIColor.clear
        collectiView.register(DiscoverItemCollectionCell.self, forCellWithReuseIdentifier: "cellId")
        return collectiView
    }()
    var items: [Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectiV.delegate = self
        collectiV.dataSource = self
        view.addSubview(collectiV)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
        //return (items?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
