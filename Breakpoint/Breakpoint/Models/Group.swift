//
//  Group.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 1/10/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import Foundation

class Group {
    private(set) var groupTitle: String
    private(set) var groupDesc: String
    private(set) var key: String
    private(set) var memberCount: Int
    private(set) var members: [String]
    
    init(title: String, description: String, key: String, memberCount: Int, members: [String]) {
        groupTitle = title
        groupDesc = description
        self.key = key
        self.memberCount = memberCount
        self.members = members
    }
}
