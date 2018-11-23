//
//  ViewController.swift
//  Prenetics Task
//
//  Created by Kishore on 22/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginVC: UIViewController {

    @IBOutlet weak var userNameTV: UITextField!
    @IBOutlet weak var passwordTV: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        SVProgressHUD.show()
        
        if let username = userNameTV.text, username.isEmpty {
            view.makeToast("Please enter a vaild user name")
            SVProgressHUD.dismiss()
            return
        }
        
        if let passwordTV = passwordTV.text, passwordTV.isEmpty {
            view.makeToast("Please enter a vaild password")
            SVProgressHUD.dismiss()
            return
        }
        
        WebSerivce.instance.checkLogin(userName: userNameTV.text!, password: passwordTV.text!) { (success, message) in
            if success {
                self.performSegue(withIdentifier: "loginSuccessSegue", sender: nil)
                UserDefaults.standard.set("1", forKey: "customerID")
            }
            SVProgressHUD.dismiss()
        }
    }
    

}

