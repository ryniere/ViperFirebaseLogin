//
//  LoginProtocols.swift
//  LeiSecaMaps
//
//  Created by Ryniere S Silva on 18/05/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import TwitterKit

protocol LoginRouterProtocol : class {
	
	func dismissLogin()
}

protocol LoginViewProtocol : class {
	var presenter: LoginPresenterProtocol? { get set }
}

protocol LoginPresenterProtocol : class {
	var interactor: LoginInteractorInputProtocol? { get set }
	var router: LoginRouterProtocol? { get set }
	
	weak var view: LoginViewProtocol? { get set }
	
	func didTapFacebookLoginButton()
	func didCompleteFacebookLogin(result: FBSDKLoginManagerLoginResult!, error: NSError!)
	
	func didTapGoogleLoginButton()
	func didCompleteGoogleLogin(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
	                            withError error: NSError!)
	
	func didCompleteTwitterLogin(session: TWTRSession?, error: NSError?)
	
}

protocol LoginInteractorInputProtocol : class {
	var authenticator: LoginAuthenticatorProtocol? { get set }
	weak var presenter: LoginInteractorOutputProtocol? { get set }
	
	func didCompleteFacebookLogin(result: FBSDKLoginManagerLoginResult!, error: NSError!)
	
	func googleLogin()
	func didCompleteGoogleLogin(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
	                            withError error: NSError!)
	
	func didCompleteTwitterLogin(session: TWTRSession?, error: NSError?)
}

protocol LoginInteractorOutputProtocol : class {
	func didLoggedInWithSucess()
}

protocol LoginAuthenticatorProtocol {
	
	func didCompleteFacebookLogin(result: FBSDKLoginManagerLoginResult!, error: NSError!, completion: ((ObjCBool) -> Void))
	func didCompleteGoogleLogin(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
	                            withError error: NSError!, completion: ((ObjCBool) -> Void))
	func didCompleteTwitterLogin(session: TWTRSession?, error: NSError?, completion: ((ObjCBool) -> Void))
	
}
