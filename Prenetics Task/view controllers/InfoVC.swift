//
//  InfoVC.swift
//  Prenetics Task
//
//  Created by Kishore on 22/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import UIKit
//import "HeartRateKit/HeartRateKitController.h"
import SVProgressHUD

class InfoVC: UIViewController {

    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var emailLB: UILabel!
    @IBOutlet weak var geneticResultLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let customerID = UserDefaults.standard.string(forKey: "customerID") else {
            return
        }
        SVProgressHUD.show()
        WebSerivce.instance.getCustomer(customerID: customerID) { (success, customer) in
            self.nameLB.text = "\(customer?.firstName ?? "") \(customer?.lastName ?? "")"
            self.emailLB.text = customer?.email
            self.geneticResultLB.text = customer?.geneticResults
            SVProgressHUD.dismiss()
        }
        
    }

    @IBAction func logoutTapped(_ sender: UIBarButtonItem) {
        UserDefaults.standard.removeObject(forKey: "customerID")
        let next = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present(next, animated: true, completion: nil)
    }
}
