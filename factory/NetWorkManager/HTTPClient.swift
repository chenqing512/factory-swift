//
//  HTTPClient.swift
//  factory
//
//  Created by Qing Chen on 2018/6/1.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import Alamofire

let HTTPClientData = HTTPClient.shared

typealias Responsedata = (NSDictionary) -> Void

class HTTPClient: NSObject {
    static let shared = HTTPClient();
    private override init() {}
    override func copy() -> Any {
        return self
    }
    override func mutableCopy() -> Any {
        return self
    }
}

func post(path: String, parameters: NSDictionary, responseData: Responsedata){
    
}
