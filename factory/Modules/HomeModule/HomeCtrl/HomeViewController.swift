//
//  HomeViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/6/2.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import Alamofire
class HomeViewController: WGViewController, UIScrollViewDelegate {

    fileprivate lazy var titleView: HomeTitleView = {
        let v = HomeTitleView(frame: CGRect(x: 0, y: 0, width: WGUtil.screenWidth()-80, height: 36.5))
        return v
    }()
    
    var ctrls: Array<Any> = []
    fileprivate lazy var scrollV: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: WGUtil.screenWidth(), height: WGUtil.screenHeight()))
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 6*WGUtil.screenWidth(), height: WGUtil.screenHeight())
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = UIColor.red
        return scrollView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationView()
        setupViewControllers()
        view.addSubview(scrollV)
        scrollviewScrollAtIndex(index: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateNavigationView(){
        updateLeftButton()
        leftButton?.isHidden = false
        leftButton?.setImage(UIImage(named: "search_img"), for: .normal)
        navigationItem.titleView = titleView
        
    }
    
    func setupViewControllers(){
        for _ in 0..<6 {
            let vc = HomeDetailViewController()
            ctrls.append(vc)
        }
    }
    
    func scrollviewScrollAtIndex(index: Int){
        let ctrl = ctrls[index] as! UIViewController
        if ctrl.isViewLoaded {
            return
        }
        ctrl.view.frame = scrollV.bounds
        scrollV.addSubview(ctrl.view)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var ind = scrollView.contentOffset.x/WGUtil.screenWidth()
        scrollviewScrollAtIndex(index: Int(ind))
    }
    
   

}
