//
//  GroupCell.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 1/10/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configCell(title: String, description: String, memberCount: Int) {
        groupTitleLbl.text = title
        groupDescLbl.text = description
        memberCountLbl.text = "\(memberCount) members."
    }
    
}
