//
//  UserDataService.swift
//  Smack
//
//  Created by Jefffrey Santana on 11/15/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[],")
        let comma = CharacterSet(charactersIn: ",")
        let defaultColor = UIColor.lightGray
        var r, g, b, a: NSString?
        
        scanner.charactersToBeSkipped = skipped
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        guard let r_Unwrapped = r else { return defaultColor }
        guard let g_Unwrapped = g else { return defaultColor }
        guard let b_Unwrapped = b else { return defaultColor }
        guard let a_Unwrapped = a else { return defaultColor }
        
        let r_Float = CGFloat(r_Unwrapped.doubleValue)
        let g_Float = CGFloat(g_Unwrapped.doubleValue)
        let b_Float = CGFloat(b_Unwrapped.doubleValue)
        let a_Float = CGFloat(a_Unwrapped.doubleValue)
        
        let newUIColor = UIColor(displayP3Red: r_Float, green: g_Float, blue: b_Float, alpha: a_Float)
        
        return newUIColor
    }
    
}
