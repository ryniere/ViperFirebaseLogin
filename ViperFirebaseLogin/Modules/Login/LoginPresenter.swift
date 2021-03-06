//
//  LoginPresenter.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 18/05/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import TwitterKit

class LoginPresenter: LoginPresenterProtocol {
	
	var interactor: LoginInteractorInputProtocol?
	var router: LoginRouterProtocol?
	
	weak var view: LoginViewProtocol?
	
	func didTapFacebookLoginButton() {
		
	}
	
	func didCompleteFacebookLogin(result: FBSDKLoginManagerLoginResult!, error: NSError!) {
		
		interactor?.didCompleteFacebookLogin(result, error: error)
	}
	
	func didTapGoogleLoginButton() {
		interactor?.didTapGoogleLoginButton()
	}
	
	func didCompleteGoogleLogin(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
	                            withError error: NSError!) {
		interactor?.didCompleteGoogleLogin(signIn, didSignInForUser: user, withError: error)
	}
	
	func didCompleteTwitterLogin(session: TWTRSession?, error: NSError?) {
		interactor?.didCompleteTwitterLogin(session, error: error)
	}
}


// MARK: LoginInteractorOutputProtocol

extension LoginPresenter: LoginInteractorOutputProtocol {
	
	func didLoggedInWithSuccess() {
		
		router?.dismissLogin()
	}
}