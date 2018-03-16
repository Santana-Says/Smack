//
//  ShadowView.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/24/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit
@IBDesignable

class ShadowView: UIView {
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }
    
    override func awakeFromNib() {
        customizeView()
        super.awakeFromNib()
    }

    func customizeView() {
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 5
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }

}
