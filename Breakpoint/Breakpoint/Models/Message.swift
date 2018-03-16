//
//  Message.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/27/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import Foundation


class Message {
    private(set) var content: String
    private(set) var senderId: String
    
    init(content: String, senderId: String) {
        self.content = content
        self.senderId = senderId
    }
}
