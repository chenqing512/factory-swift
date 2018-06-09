//
//  HomeDetailViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/6/5.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class HomeDetailViewController: WGViewController, UITableViewDelegate, UITableViewDataSource {

    var tableV: UITableView?
    var dataArray: Array<Any> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.blue
        layoutView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func layoutView(){
        tableV = UITableView(frame: CGRect(x: 0, y: 0, width: WGUtil.screenWidth(), height: WGUtil.screenHeight()-WGUtil.statusBarHeight()-44-SharedData.tabBarHeight), style: .plain)
        tableV?.delegate = self
        tableV?.dataSource = self
        tableV?.separatorStyle = .none
        tableV?.register(HomeDetailCell.self, forCellReuseIdentifier: "cellId")
        tableV?.rowHeight = WGUtil.screenWidth()
        view.addSubview(tableV!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        return cell
    }

}
