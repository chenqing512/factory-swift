//
//  HomeViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/6/2.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON
class HomeViewController: WGViewController, UIScrollViewDelegate {

    fileprivate lazy var titleView: HomeTitleView = {
        let v = HomeTitleView(frame: CGRect(x: 0, y: 0, width: WGUtil.screenWidth()-80, height: 36.5))
        return v
    }()
    
    var ctrls = [Any]()
    var adSlide = [Any]()
    var tags = [Any]()
    fileprivate lazy var scrollV: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: WGUtil.screenWidth(), height: WGUtil.screenHeight()))
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: CGFloat(tags.count)*WGUtil.screenWidth(), height: WGUtil.screenHeight())
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
      //  scrollView.backgroundColor = UIColor.red
        return scrollView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        
        updateNavigationView()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 添加UI
    func updateNavigationView(){
        updateLeftButton()
        leftButton?.isHidden = false
        leftButton?.setImage(UIImage(named: "search_img"), for: .normal)
        navigationItem.titleView = titleView
        
    }
    
    func setupViewControllers(){
        for index in 0..<tags.count {
            let dict = tags[index] as! [String: Any]
            let vc = HomeDetailViewController()
            vc.idStr = dict["id"] as! Int
            ctrls.append(vc)
        }
    }
    
    //MARK: scrollview 代理方法
    func scrollviewScrollAtIndex(index: Int){
        let ctrl = ctrls[index] as! UIViewController
        if ctrl.isViewLoaded {
            return
        }
        ctrl.view.frame = scrollV.bounds
        scrollV.addSubview(ctrl.view)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let ind = scrollView.contentOffset.x/WGUtil.screenWidth()
        scrollviewScrollAtIndex(index: Int(ind))
    }
    
    
    func loadData(){
        HTTPClientData.post(path: "v31/homepage-tag", parameters: [:]) { (success, response) in
            self.tags = response["data"] as! [Any]
            self.adSlide = response["adSlide"] as! [Any]
            self.titleView.titles = self.tags
            self.setupViewControllers()
            self.view.addSubview(self.scrollV)
            self.scrollviewScrollAtIndex(index: 0)
            print(response)
        }
    }
   

}
