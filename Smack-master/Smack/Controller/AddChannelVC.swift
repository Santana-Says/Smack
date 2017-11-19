//
//  AddChannelVC.swift
//  Smack
//
//  Created by Jeffrey Santana on 11/19/17.
//  Copyright © 2017 Jefffrey Santana. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descriptionTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        titleTxt.attributedPlaceholder = NSAttributedString(string: "Title", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        descriptionTxt.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
    }
    
    @IBAction func onCreateChannelPressed(_ sender: ButtonView) {
    }
    
    @IBAction func onCloseModalPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
