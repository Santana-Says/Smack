//
//  GroupFeedCell.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 1/12/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

	//Outlets
	@IBOutlet weak var profileImg: UIImageView!
	@IBOutlet weak var emailLbl: terminalStyleLabel!
	@IBOutlet weak var contentLbl: UILabel!
	
	func configCell(profileImg img: UIImage, email: String, content: String) {
		profileImg.image = img
		emailLbl.text = email
		contentLbl.text = content
	}
}
