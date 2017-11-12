//
//  ButtonView.swift
//  Smack
//
//  Created by Jefffrey Santana on 11/12/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonView: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 5.0
        backgroundColor = #colorLiteral(red: 0.3568627451, green: 0.6235294118, blue: 0.7960784314, alpha: 1)
        setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    }

}
