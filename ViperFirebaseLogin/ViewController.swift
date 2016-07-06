//
//  ViewController.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 04/07/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

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

