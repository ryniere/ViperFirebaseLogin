//
//  LoginView.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 18/05/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import TwitterKit

class LoginViewController: UIViewController, LoginViewProtocol {
	
	var presenter: LoginPresenterProtocol?
	
	@IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
	@IBOutlet weak var twitterLoginButton: TWTRLogInButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupLoginButtons()
		
	}
	
	
	private func setupLoginButtons() {
		facebookLoginButton.delegate = self
		GIDSignIn.sharedInstance().delegate = self
		GIDSignIn.sharedInstance().uiDelegate = self
		
		twitterLoginButton.logInCompletion = { (session, error) in
			self.presenter?.didCompleteTwitterLogin(session, error: error)
		}
	}
	
	@IBAction func tapFacebookLoginButton(sender: AnyObject) {
		presenter?.didTapFacebookLoginButton()
	}
	
	@IBAction func tapGoogleLoginButton(sender: AnyObject) {
		presenter?.didTapGoogleLoginButton()
	}
	
}

// MARK: FBSDKLoginButtonDelegate

extension LoginViewController: FBSDKLoginButtonDelegate {
	
	
	func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
		
		presenter?.didCompleteFacebookLogin(result, error: error)
	}
	
	func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
		
	}
}

// MARK: GIDSignInDelegate
extension LoginViewController: GIDSignInDelegate {
	
	func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
	            withError error: NSError!) {
		presenter?.didCompleteGoogleLogin(signIn, didSignInForUser: user, withError: error)
	}
	
	func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
	            withError error: NSError!) {
		
	}
}

// MARK: GIDSignInUIDelegate

extension LoginViewController: GIDSignInUIDelegate {
	
	func signIn(signIn: GIDSignIn!, dismissViewController viewController: UIViewController!) {
		
		
	}
}
