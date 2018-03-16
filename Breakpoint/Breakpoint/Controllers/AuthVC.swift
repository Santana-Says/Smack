//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 12/24/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func facebookSignInPressed(_ sender: Any) {
		let fbLoginManager = FBSDKLoginManager()
		fbLoginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
			if let error = error {
				print("Failed to login: \(error.localizedDescription)")
				return
			}
			
			guard let accessToken = FBSDKAccessToken.current() else {
				print("Failed to get access token")
				return
			}
			
			let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
			
			AuthService.instance.loginFbUser(credential: credential, loginComplete: { (complete, loginError) in
				if complete {
					self.dismiss(animated: true, completion: nil)
				} else {
					print(String(describing: loginError?.localizedDescription))
				}
			})
			
		}
		
	}
    
    @IBAction func googleSignInPressed(_ sender: Any) {
    }
    
    @IBAction func emailSignInPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    

}

