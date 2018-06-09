//
//  HomeDetailViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/6/5.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class HomeDetailViewController: WGViewController, UITableViewDelegate, UITableViewDataSource {

    var idStr: Int = 1
    var currPage: Int?
    var maxPage: Int?
    var tableV: UITableView?
    var dataArray: Array<Any> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.blue
        layoutView()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 创建视图
    func layoutView(){
        tableV = UITableView(frame: CGRect(x: 0, y: 0, width: WGUtil.screenWidth(), height: WGUtil.screenHeight()-WGUtil.statusBarHeight()-44-SharedData.tabBarHeight), style: .plain)
        tableV?.delegate = self
        tableV?.dataSource = self
        tableV?.separatorStyle = .none
        tableV?.register(HomeDetailCell.self, forCellReuseIdentifier: "cellId")
        tableV?.rowHeight = WGUtil.screenWidth()+10
        view.addSubview(tableV!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! HomeDetailCell
        cell.vModel = dataArray[indexPath.row] as! BigVModel
        return cell
    }
    
    func loadData(){
        HTTPClientData.post(path: "v31/homepage", parameters: ["tagId":idStr,"page":1]) { (success, response) in
            var data = response["data"] as? [Any]
            self.currPage = response["currPage"] as? Int
            self.maxPage = response["currPage"] as? Int
            
            for index in 0..<data!.count{
                let dic = data![index] as! [String: Any]
                let bigVModel = JSONDeserializer<BigVModel>.deserializeFrom(dict: dic)
                self.dataArray.append(bigVModel!)
            }
            self.tableV?.reloadData()
            print(response)
        }
    }

}
