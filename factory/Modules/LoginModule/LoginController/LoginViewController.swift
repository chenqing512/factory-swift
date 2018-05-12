//
//  LoginViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/5/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

protocol LoginViewDelegate {
    func onLoginResult(result: String);
}

class LoginViewController: WGViewController, LoginViewDelegate {

    private let presenter = LoginPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(viewDelegate: self);
        presenter.login(userName: "111", pwd: "222");
        // Do any additional setup after loading the view.
    }
    
    func onLoginResult(result: String) {
        print("登录回调")
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
