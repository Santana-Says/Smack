//
//  SecondViewController.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/24/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var groupsTableView: UITableView!
    
    //Variables
    var groupsArray = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsTableView.delegate = self
        groupsTableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //listens for any changes on firebase
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (usersGroups) in
                self.groupsArray = usersGroups
                self.groupsTableView.reloadData()
            }
        }
    }

}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupsTableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else {
            return UITableViewCell()
        }
        let group = groupsArray[indexPath.row]
        cell.configCell(title: group.groupTitle, description: group.groupDesc, memberCount: group.memberCount)
        
        return cell
    }
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let groupdFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else {
			return
		}
		groupdFeedVC.initData(forGroup: groupsArray[indexPath.row])
		presentDetail(groupdFeedVC)
		//present(groupdFeedVC, animated: true, completion: nil)
	}
}




