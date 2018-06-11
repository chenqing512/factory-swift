//
//  DiscoveryViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/6/2.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class DiscoveryViewController: WGViewController {

    var titleView: DiscoverTitleView?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleView = DiscoverTitleView(frame: CGRect(x: 0, y: 0, width: 180, height: 44), titles: ["热门","最新","关注"])
        navigationItem.titleView = titleView
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
