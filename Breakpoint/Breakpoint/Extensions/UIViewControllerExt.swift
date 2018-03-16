//
//  UIViewControllerExt.swift
//  Breakpoint
//
//  Created by Jeffrey Santana on 1/12/18.
//  Copyright © 2018 Jefffrey Santana. All rights reserved.
//

import UIKit

extension UIViewController {
	func presentDetail(_ viewControllerToPresent: UIViewController) {
		let transition = CATransition()
		transition.duration = 1
		transition.type = kCATransitionFade
		//transition.subtype = kCATransitionFromRight
		view.window?.layer.add(transition, forKey: kCATransition)
		
		present(viewControllerToPresent, animated: false, completion: nil)
	}
	
	func dismissDetail() {
		let transition = CATransition()
		transition.duration = 0.5
		transition.type = kCATransitionFade
		//transition.subtype = kCATransitionFromLeft
		view.window?.layer.add(transition, forKey: kCATransition)
		
		dismiss(animated: false, completion: nil)
	}
}
