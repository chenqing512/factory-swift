//
//  WelcomeViewController.swift
//  factory
//
//  Created by Qing Chen on 2018/5/11.
//  Copyright © 2018年 Qing Chen. All rights reserved.
//

import UIKit

class WelcomeViewController: WGViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var agreementBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtnClick(_ sender: Any) {
        navigationController?.pushViewController(LoginViewController(), animated: true);
    }
    
    @IBAction func agreeBtnClick(_ sender: Any) {
        print("用户协议");
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.setNavigationBarHidden(true, animated: animated);
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        navigationController?.setNavigationBarHidden(false, animated: animated);
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
