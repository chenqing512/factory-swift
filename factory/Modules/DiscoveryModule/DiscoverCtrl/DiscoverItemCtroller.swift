//
//  DiscoverItemCtroller.swift
//  factory
//
//  Created by ChenQing on 2018/6/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import HandyJSON

enum DiscoverType: Int {
    case HOT
    case NEW
    case ATTENTION
}

class DiscoverItemCtroller: WGViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var _type: DiscoverType!
    var type: DiscoverType! {
        get{
            return _type
        }
        set{
            _type = newValue
        }
    }
    var mjheader = MJRefreshNormalHeader()
    var mjfooter = MJRefreshBackNormalFooter()
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
    var currPage: Int?
    var maxPage: Int?
    var items: [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        currPage = 1
        collectiV.delegate = self
        collectiV.dataSource = self
        view.addSubview(collectiV)
        mjheader.setRefreshingTarget(self, refreshingAction: #selector(loadData))
        collectiV.mj_header = mjheader
        collectiV.mj_header.beginRefreshing()
        mjfooter.setRefreshingTarget(self, refreshingAction: #selector(loadData))
        mjfooter.setTitle("我是有底线的", for: .noMoreData)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! DiscoverItemCollectionCell
        cell.videoModel = items[indexPath.row] as? VideoModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    @objc func loadData(){
        if currPage != nil && currPage! > 1 && currPage! >= maxPage! {
            mjfooter.endRefreshingWithNoMoreData()
            return
        }
        var pathStr: String?
        switch type {
        case .HOT:
            pathStr = "v32/smallvideo/hot-list"
        case .NEW:
            pathStr = "v32/smallvideo/new-list"
        case .ATTENTION:
            pathStr = "v32/smallvideo/follow-list"
        default:
            pathStr = "v32/smallvideo/hot-list"
        }
        HTTPClientData.post(path: pathStr!, parameters: ["page":currPage!]) { (success, response) in
            self.mjheader.endRefreshing()
            self.mjfooter.endRefreshing()
            var data = response["data"] as? [Any]
            self.currPage = response["currPage"] as? Int
            if self.currPage == nil {
                self.currPage = 1
            }
            if self.currPage == 1 {
                self.items.removeAll()
            }
            self.maxPage = response["maxPage"] as? Int
            if data != nil {
                for index in 0..<data!.count{
                    let dict = data![index] as! [String: Any]
                    let videoModel = JSONDeserializer<VideoModel>.deserializeFrom(dict: dict)
                    self.items.append(videoModel!)
                }
                self.collectiV.reloadData()
            }
            
        }
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
