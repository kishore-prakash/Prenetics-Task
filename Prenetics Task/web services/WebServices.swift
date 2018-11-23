//
//  WebServices.swift
//  Prenetics Task
//
//  Created by Kishore on 22/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import UIKit
import Alamofire

class WebSerivce {
    static let instance = WebSerivce()
    
    private init() {
        
    }
    
    func checkLogin(userName: String, password: String, completionHandler: @escaping (_ success: Bool, _ customerID: String?) -> Void) {
        let parameters: Parameters = ["username": userName, "password": password]
        Alamofire.request("https://api.prenetics.com/v1/customer/login", method: .post, parameters: parameters, encoding: URLEncoding.httpBody).response {
            response in
            guard let _ = response.data else {
                completionHandler(false, nil)
                return
            }
            
            // get data from response and pasrse to pass it on to the completionHandler
            completionHandler(true, "customer ID")
        }
    }
    
    func getCustomer(customerID: String, completionHandler: @escaping (_ success: Bool, _ data: Customer?) -> Void) {
        let urlString = "https://api.prenetics.com/v1/customer/\(customerID)/user"
        Alamofire.request(urlString, method: .get).response {
            response in
            guard let _ = response.data else {
                completionHandler(false, nil)
                return
            }
            
            let customer = Customer()
            customer.firstName = "Kishore"
            customer.lastName = "Prakash"
            customer.email = "kishore.balasa@gmail.com"
            customer.dob = Date()
            completionHandler(true, customer)
        }
    }
    
    func postHeatrate(customerID: String, heartRate: String, timestamp: String, completionHandler: @escaping (_ success: Bool, _ message: String?) -> Void) {
        let parameters: Parameters = ["rate": heartRate, "timestamp": timestamp]
        let urlString = "https://api.prenetics.com/v1/customer/\(customerID)/heartrate"
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody).response {
            response in
            guard let _ = response.data else {
                completionHandler(false, "Error from server")
                return
            }
            
            // get data from response and pasrse to pass it on to the completionHandler
            completionHandler(true, "Heart reate posted successfully")
        }
    }
    
}
