//
//  LoginViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/5/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol LoginViewDelegate {
    func onLoginResult(result: String);
}

class LoginViewController: WGViewController, LoginViewDelegate {

    private let presenter = LoginPresenter()
    fileprivate let disposeBag = DisposeBag()
    
    @IBOutlet weak var passwdTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  presenter.attachView(viewDelegate: self);
        leftButton?.isHidden = false
        labelTitle?.text = "登录"
        phoneNumTF.rx.text.orEmpty.bind(to: presenter.phoneNum).disposed(by: disposeBag)
        passwdTF.rx.text.orEmpty.bind(to: presenter.userPwd).disposed(by: disposeBag)
        
        loginBtn.rx.tap.bind(to: presenter.loginTaps).disposed(by: disposeBag)
        
        presenter.loginEnable.subscribe(onNext: { [weak self] result in
            if result {
                self?.loginBtn.isEnabled = true
                self?.loginBtn.backgroundColor = UIColor.blue
            }else{
                self?.loginBtn.isEnabled = false
                self?.loginBtn.backgroundColor = UIColor.colorWithHexString(stringToConvert: "bdbdbd")
            }
        }).disposed(by: disposeBag);
        
        presenter.loginResult.subscribe(onNext: { [weak self] result in
            if result {
                print("登录成功")
            }else{
                print("登录失败")
            }
        }).disposed(by: disposeBag)
       
    }
    
    func onLoginResult(result: String) {
        print("登录回调")
    }

    @IBAction func loginClick(_ sender: Any) {
    }
    
    @IBAction func registerClick(_ sender: Any) {
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
