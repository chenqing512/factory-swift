//
//  HTTPClient.swift
//  factory
//
//  Created by Qing Chen on 2018/6/1.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

let HTTPClientData = HTTPClient.shared

typealias Responsedata = (Bool,[String: Any]) -> Void

class HTTPClient: NSObject {
    static let shared = HTTPClient();
    private override init() {}
    override func copy() -> Any {
        return self
    }
    override func mutableCopy() -> Any {
        return self
    }
    
    func post(path: String, parameters: [String: Any], responseData: @escaping Responsedata){
        var dict = parameters;
        if SharedData.user?.id != nil {
             dict.updateValue(SharedData.user?.id ?? "", forKey: "userId")
        }
        if SharedData.user?.userKey != nil {
            dict.updateValue(SharedData.user?.userKey ?? "", forKey: "userKey")
        }
       
        
        Alamofire.request(kHttpHost + path, method: .post, parameters: dict , encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            print(path+"----->"+dict.description)
            print(response.result.value ?? "")
            if response.result.isSuccess {
                responseData(true,response.result.value as! [String : Any])
            }else{
                print("网络请求异常")
            }
        }
    }
}


