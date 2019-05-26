//
//  Message.swift
//  breakpoint
//
//  Created by yasser ahmed on 4/24/19.
//  Copyright © 2019 yasser ahmed. All rights reserved.
//

import Foundation

class Message{
    public private(set) var msg_content : String
    public private(set) var msg_senderId : String
    
    init(msg_content : String , msg_senderId : String) {
        self.msg_content = msg_content
        self.msg_senderId = msg_senderId
    }

}
