//
//  FirebaseAuthenticator.swift
//  LeiSecaMaps
//
//  Created by Ryniere S Silva on 20/05/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import FBSDKLoginKit
import TwitterKit
import Firebase

class FirebaseAuthenticator: LoginAuthenticatorProtocol {
	
	func didCompleteFacebookLogin(result: FBSDKLoginManagerLoginResult!, error: NSError!, completion: ((ObjCBool) -> Void)) {
		
		if error == nil {
			
			if !result.isCancelled {
				let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
				
				self.signInWithCredential(credential, completion:completion)
			}
		}
	}
	
	func didCompleteGoogleLogin(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
	                            withError error: NSError!, completion: ((ObjCBool) -> Void)) {
		
		if let error = error {
			print(error.localizedDescription)
			return
		}
		
		let authentication = user.authentication
		let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken,
                                                               accessToken: authentication.accessToken)
		
		self.signInWithCredential(credential, completion:completion)
	}
	
	func didCompleteTwitterLogin(session: TWTRSession?, error: NSError?, completion: ((ObjCBool) -> Void)) {
		
		if (session != nil) {
			let authToken = session!.authToken
			let authTokenSecret = session!.authTokenSecret
			
			let credential = FIRTwitterAuthProvider.credentialWithToken(authToken, secret: authTokenSecret)
			
			self.signInWithCredential(credential, completion:completion)
			
		} else {
			
		}
	}
	
	private func signInWithCredential(credential: FIRAuthCredential, completion: ((ObjCBool) -> Void)) {
		
		FIRAuth.auth()?.signInWithCredential(credential, completion: { (user, error) in
			if error == nil {
				completion(true)
			} else {
				completion(false)
			}
		})
	}
}
