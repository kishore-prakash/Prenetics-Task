//
//  Customer.swift
//  Prenetics Task
//
//  Created by Kishore on 22/11/18.
//  Copyright © 2018 Kishore. All rights reserved.
//

import Foundation

class Customer {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var dob: Date
    var geneticResults: String
    
    init() {
        self.id = String()
        self.firstName = String()
        self.lastName = String()
        self.email = String()
        self.password = String()
        self.dob = Date()
        self.geneticResults = String()
    }

}
