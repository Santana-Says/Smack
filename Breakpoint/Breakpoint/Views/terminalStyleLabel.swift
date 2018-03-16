//
//  terminalStyleLabel.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/24/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit
@IBDesignable

class terminalStyleLabel: UILabel {

    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeView()
    }
    
    func customizeView() {
        textColor = #colorLiteral(red: 0.01568627451, green: 0.6705882353, blue: 0.7725490196, alpha: 1)
        textAlignment = .center
        font = UIFont(name: "menlo", size: 18)
    }

}
