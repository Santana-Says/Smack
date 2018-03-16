//
//  CreateGroupVC.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/27/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailsearchTextField: InsetTextField!
    @IBOutlet weak var groupMembersLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var emailResults = [String]()
    var chosenUserArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailsearchTextField.delegate = self
        
        emailsearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneBtn.isHidden = true
    }
    
    @objc func textFieldDidChange() {
        if emailsearchTextField.text == "" {
            emailResults.removeAll()
            tableView.reloadData()
        } else {
            DataService.instance.getEmail(forSearchQuery: emailsearchTextField.text!, handler: { (foundEmails) in
                self.emailResults = foundEmails
                self.tableView.reloadData()
            })
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataService.instance.getIds(forUsernames: chosenUserArray, handler: { (idsArray) in
                var userIds = idsArray
                userIds.append((Auth.auth().currentUser?.uid)!)
                
                DataService.instance.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, forUserIds: userIds, handler: { (groupCreated) in
                    if groupCreated {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("group could not be created")
                    }
                })
            })
        }
    }
    
}

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else {
            return UITableViewCell()
        }
        let profileImage = UIImage(named: "defaultProfileImage")
        
        if chosenUserArray.contains(emailResults[indexPath.row]) {
            cell.configCell(profileImage: profileImage!, email: emailResults[indexPath.row], isSelected: true)
        } else {
            cell.configCell(profileImage: profileImage!, email: emailResults[indexPath.row], isSelected: false)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else {return}
        if !chosenUserArray.contains(cell.emailLbl.text!) {
            chosenUserArray.append(cell.emailLbl.text!)
        } else {
            chosenUserArray = chosenUserArray.filter({$0 != cell.emailLbl.text!})
        }
        
        if chosenUserArray.count >= 1 {
            groupMembersLbl.text = chosenUserArray.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            groupMembersLbl.text = "add people to your group"
            doneBtn.isHidden = true
        }
    }
}

extension CreateGroupVC: UITextFieldDelegate {
    
}
