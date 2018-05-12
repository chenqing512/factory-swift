//
//  LoginModel.swift
//  factory
//
//  Created by Qing Chen on 2018/5/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class LoginModel: NSObject {
    func login(userName: String, pwd: String, callback: ((String)->Void)){
        callback("123");
    }
}
