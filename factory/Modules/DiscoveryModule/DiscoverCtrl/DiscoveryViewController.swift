//
//  DiscoveryViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/6/2.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class DiscoveryViewController: WGViewController, UIScrollViewDelegate, DiscoverItemDelegate {

    var titleView: DiscoverTitleView?
    var items: [Any] = [Any]()
    
    lazy var scrollV: UIScrollView? = {
       let v = UIScrollView(frame: CGRect(x: 0, y: 0, width: WGUtil.screenWidth(), height: WGUtil.screenHeight()))
        v.delegate = self
        v.contentSize = CGSize(width: WGUtil.screenWidth() * CGFloat(items.count), height: WGUtil.screenHeight())
        v.isPagingEnabled = true
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.init(rawValue: 0)
        titleView = DiscoverTitleView(frame: CGRect(x: 0, y: 0, width: 180, height: 44), titles: ["热门","最新","关注"])
        titleView?.delegate = self
        navigationItem.titleView = titleView
        setupCtrls()
        view.addSubview(scrollV!)
        scrollViewScrollAtIndex(index: 1)
    }
    
    func setupCtrls(){
        for _ in 0..<3 {
            let vc = DiscoverItemCtroller()
            items.append(vc)
        }
    }
    
    func scrollViewScrollAtIndex(index: Int){
        let ctrl = items[index] as! UIViewController
        scrollV?.setContentOffset(CGPoint(x: CGFloat(index)*WGUtil.screenWidth(), y: 0), animated: true)
        if ctrl.isViewLoaded {
            return
        }
        ctrl.view.frame = CGRect(x: WGUtil.screenWidth() * CGFloat(index), y: 0, width: WGUtil.screenWidth(), height: WGUtil.screenHeight())
        scrollV?.addSubview(ctrl.view!)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / WGUtil.screenWidth()
        scrollViewScrollAtIndex(index: Int(index))
    }
    
    func selectItemAtIndex(index: Int) {
        scrollViewScrollAtIndex(index: index)
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
