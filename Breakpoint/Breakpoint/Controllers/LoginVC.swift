//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/24/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if emailField.text != nil || passwordField != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (complete, loginError) in
                if complete {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (complete, registrationError) in
                    if complete {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (complete, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            })
        }
    }
    

}

extension LoginVC: UITextFieldDelegate {
    
}
