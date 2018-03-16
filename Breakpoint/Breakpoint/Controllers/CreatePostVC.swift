//
//  CreatePostVC.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/26/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    //Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
        sendBtn.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                self.sendBtn.isEnabled = true
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.sendBtn.isEnabled = true
            print("There was an error posting")
        }
    }
    
    
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
