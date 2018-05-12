//
//  LoginPresenter.swift
//  factory
//
//  Created by Qing Chen on 2018/5/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class LoginPresenter: NSObject {
    private var loginViewDelegate: LoginViewDelegate?
    private var loginModel: LoginModel?
    
    override init() {
        loginModel = LoginModel();
    }
    
    func login(userName: String, pwd: String){
        loginModel?.login(userName: userName, pwd: pwd, callback: { (result) in
            loginViewDelegate?.onLoginResult(result: result);
        })
    }
    
    func attachView(viewDelegate: LoginViewDelegate){
        loginViewDelegate = viewDelegate;
    }
}
