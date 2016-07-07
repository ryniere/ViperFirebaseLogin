//
//  ProfileViewController.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 05/07/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewInput {
	
	var output: ProfileViewOutput?
	
	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var userNameLabel: UILabel!
	
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		ProfileModuleConfigurator.configure(self)
		output!.viewIsReady()
	}
	
	
	// MARK: ProfileViewInput
	func setupInitialState() {
		

	}
}
