//
//  ViewController.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 04/07/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import UIKit
import Firebase
import Haneke

class ViewController: UIViewController {

	@IBOutlet weak var userProfileImageView: UIImageView!
	@IBOutlet weak var userNameLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
				if let user = FIRAuth.auth()?.currentUser {
					// User is signed in.
					
					self.userNameLabel.text = user.displayName
					
					if let url = user.photoURL {
						self.userProfileImageView.circularView()
						self.userProfileImageView.hnk_setImageFromURL(url)
					}
		
				} else {
					// No user is signed in.
					LoginRouter.showLoginOnView(self, authenticator: FirebaseAuthenticator())
				}
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
		
	}


}

