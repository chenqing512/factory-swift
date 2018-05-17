//
//  LoginPresenter.swift
//  factory
//
//  Created by Qing Chen on 2018/5/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import Foundation
import RxSwift

class LoginPresenter {
    let phoneNum = Variable<String>("")
    let userPwd = Variable<String>("")
    let loginTaps = PublishSubject<Void>()
    
    let phoneNumValid: Observable<Bool>
    let userPwdValid: Observable<Bool>
    let loginEnable: Observable<Bool>
    
    /// 登录结果及逻辑
    let loginResult: Observable<Bool>
    
    init() {
        phoneNumValid = phoneNum.asObservable().map { name in
            if name.count == 11 {
                return true
            }
            return false
        }.share(replay: 1, scope: .whileConnected)
        
        userPwdValid = userPwd.asObservable().map { pwd in
            if pwd.count >= 6 {
                return true
            }
            return false
        }.share(replay: 1, scope: .whileConnected)
        
        loginEnable = Observable.combineLatest(phoneNumValid,userPwdValid) {
            return $0 && $1
        }
        
        let phoneNumAndPwd = Observable.combineLatest(phoneNum.asObservable(),userPwd.asObservable()){
            ($0,$1)
        }
        
        loginResult = loginTaps.asObserver().withLatestFrom(phoneNumAndPwd).flatMapLatest{ (name, pwd) -> Observable<Bool> in
            return Observable.just(true)
        }.share(replay: 1, scope: .whileConnected)
    }
    /*
    private var loginViewDelegate: LoginViewDelegate?
  //  private var loginModel: LoginModel?
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
    
    func confirmBtn(){
        
    }
 */
    
}
