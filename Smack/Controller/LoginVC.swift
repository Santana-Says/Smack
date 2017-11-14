//
//  LoginVC.swift
//  Smack
//
//  Created by Jefffrey Santana on 11/12/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: ButtonView) {
        guard let username = usernameTxt.text, usernameTxt.text != "" else {return}
        guard let password = passwordTxt.text, passwordTxt.text != "" else {return}
        
        AuthService.instance.loginUser(email: username, password: password) { (success) in
            if success {
                print("Logged in user!", AuthService.instance.authToken)
            }
        }
    }
    
    @IBAction func createAccountBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: self)
    }
    
}
