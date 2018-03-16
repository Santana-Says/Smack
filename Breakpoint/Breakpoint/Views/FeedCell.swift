//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/26/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    func configCell(profileImg: UIImage, email: String, content: String) {
        self.profileImg.image = profileImg
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
