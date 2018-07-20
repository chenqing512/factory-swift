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
    var mjheader = MJRefreshNormalHeader()
    var mjfooter = MJRefreshBackNormalFooter()
    var tableV: UITableView?
    var dataArray: Array<Any> = []
    lazy var emptyView: WGEmptyView = {
        let v = WGEmptyView(frame: self.view.bounds)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currPage = 1
        layoutView()
        //self.view.backgroundColor = UIColor.blue
        view.addSubview(emptyView)
        emptyView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        mjfooter.setRefreshingTarget(self, refreshingAction: #selector(createData))
        mjheader.setRefreshingTarget(self, refreshingAction: #selector(loadMoreData))
        tableV?.mj_footer = mjfooter
        tableV?.mj_header = mjheader
        mjfooter.setTitle("我是有底线的", for: .noMoreData)
        
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
    
    @objc func createData(){
        currPage = 1;
        loadData()
    }
    
    @objc func loadMoreData(){
        currPage = currPage! + 1
        loadData()
    }
    
    @objc func loadData(){
        if currPage! > 1 && currPage! >= maxPage! {
            mjfooter.endRefreshingWithNoMoreData()
            return
        }
        HTTPClientData.post(path: "v31/homepage", parameters: ["tagId":idStr,"page":currPage!]) { (success, response) in
            var data = response["data"] as? [Any]
            self.currPage = Int((response["currPage"] as? String)!)
            self.maxPage = response["maxPage"] as? Int
            
            if data != nil {
                self.emptyView.isHidden = true
                for index in 0..<data!.count{
                    let dic = data![index] as! [String: Any]
                    let bigVModel = JSONDeserializer<BigVModel>.deserializeFrom(dict: dic)
                    self.dataArray.append(bigVModel!)
                }
                self.tableV?.reloadData()
            }
            self.mjfooter.endRefreshing()
            self.mjheader.endRefreshing()
            print(response)
        }
    }

}
