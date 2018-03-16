//
//  GroupFeedVC.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 1/12/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

	//Outlets
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet var mainView: UIView!
	@IBOutlet weak var groupTitleLbl: UILabel!
	@IBOutlet weak var membersLbl: UILabel!
	@IBOutlet weak var sendBtnView: UIView!
	@IBOutlet weak var messageTextField: InsetTextField!
	@IBOutlet weak var sendBtn: UIButton!
	
	//Variables
	var group: Group?
	var groupMessages = [Message]()
	
	func initData(forGroup group: Group) {
		self.group = group
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		//sendBtnView.bindToKeyboard()
		mainView.bindToKeyboard()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		groupTitleLbl.text = group?.groupTitle
		
		//needed to make tableview scroll to bottom
		self.tableView.estimatedRowHeight = 0
		self.tableView.estimatedSectionHeaderHeight = 0
		self.tableView.estimatedSectionFooterHeight = 0
		
		DataService.instance.getEmails(group: group!) { (returnedEmails) in
			self.membersLbl.text = returnedEmails.joined(separator: ", ")
		}
		DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
			DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
				self.groupMessages = returnedGroupMessages
				self.tableView.reloadData()
				
				if self.groupMessages.count > 0 {
					self.tableView.scrollToRow(at: IndexPath.init(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
				}
			})
		}
	}

	@IBAction func backBtnPressed(_ sender: Any) {
		//dismiss(animated: true, completion: nil)
		dismissDetail()
	}
	
	@IBAction func sendBtnPressed(_ sender: Any) {
		if messageTextField.text != "" {
			messageTextField.isEnabled = false
			sendBtn.isEnabled = false
			DataService.instance.uploadPost(withMessage: messageTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key, sendComplete: { (complete) in
				if complete {
					self.messageTextField.text = ""
					self.messageTextField.isEnabled = true
					self.sendBtn.isEnabled = true
				}
			})
		}
	}
	
	
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return groupMessages.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedCell", for: indexPath) as? GroupFeedCell else {return UITableViewCell()}
		let message = groupMessages[indexPath.row]
		DataService.instance.getUsername(forUID: message.senderId) { (email) in
			cell.configCell(profileImg: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
		}
		return cell
	}
}
