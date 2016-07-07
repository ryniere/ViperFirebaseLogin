//
//  LoginRouter.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 18/05/16.
//  Copyright © 2016 Ryniere S Silva. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {

	private weak var navigationController: UINavigationController?
	private weak var viewController: UIViewController?
	
	class func addLoginOnWindow(window: UIWindow) {
		let router = LoginRouter()
		let view = LoginViewController()
		let presenter = LoginPresenter()
		let interactor = LoginInteractor()
		
		view.presenter = presenter
		presenter.interactor = interactor
		presenter.router = router
		presenter.view = view
		interactor.presenter = presenter
		
		let navigationController = UINavigationController(rootViewController: view)
		router.navigationController = navigationController
		window.rootViewController = navigationController
	}
	
	class func showLoginOnView(viewController: UIViewController, authenticator: LoginAuthenticatorProtocol) {
		
		let router = LoginRouter()
		let view = LoginViewController()
		let presenter = LoginPresenter()
		let interactor = LoginInteractor()
		
		view.presenter = presenter
		presenter.interactor = interactor
		presenter.router = router
		presenter.view = view
		interactor.presenter = presenter
		interactor.authenticator = authenticator
		
		router.viewController = view
		
		viewController.presentViewController(view, animated: true, completion: {
		})
	}
	
	
	func dismissLogin() {
		
		viewController?.dismissViewControllerAnimated(true, completion: { 
			
		})
	}
}
