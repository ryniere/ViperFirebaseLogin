//
//  LoginInteractor.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 18/05/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import TwitterKit

class LoginInteractor: LoginInteractorInputProtocol {
	
	var authenticator: LoginAuthenticatorProtocol?
	weak var presenter: LoginInteractorOutputProtocol?
	
	func didCompleteFacebookLogin(result: FBSDKLoginManagerLoginResult!, error: NSError!) {
		
		authenticator?.didCompleteFacebookLogin(result, error: error, completion: { (success) in
			
			if success {
				self.presenter?.didLoggedInWithSucess()
			}
		})
	}
	
	func didTapGoogleLoginButton() {
		GIDSignIn.sharedInstance().signIn()
	}
	
	func didCompleteGoogleLogin(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
	                            withError error: NSError!) {
		
		authenticator?.didCompleteGoogleLogin(signIn, didSignInForUser: user, withError: error, completion: { (success) in
			if success {
				self.presenter?.didLoggedInWithSucess()
			}
		})
	}
	
	
	func didCompleteTwitterLogin(session: TWTRSession?, error: NSError?) {
		authenticator?.didCompleteTwitterLogin(session, error: error, completion: { (success) in
			if success {
				self.presenter?.didLoggedInWithSucess()
			}
		})
	}
	
}
