//
//  User.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/23/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation
class User {
    private var username: String
    private var userID : String
    private var email : String
    private var accountType : String
    init(userID: String,username: String,email: String,accountType : String) {
        self.username = username
        self.userID = userID
        self.email = email
        self.accountType = accountType
    }
}
