//
//  ProfileRouter.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 05/07/16.
//  Copyright (c) 2016 Ryniere S Silva. All rights reserved.
//

class ProfileRouter: ProfileRouterInput {
	
	var view: ProfileViewInput?
	
	private weak var navigationController: UINavigationController?
	
	class func addProfileOnWindow(window: UIWindow) {
		let router = ProfileRouter()
		let view = ProfileViewController()
		let presenter = ProfilePresenter()
		let interactor = ProfileInteractor()
		
		view.output = presenter
		presenter.interactor = interactor
		presenter.router = router
		presenter.view = view
		interactor.output = presenter
		
		let navigationController = UINavigationController(rootViewController: view)
		router.navigationController = navigationController
		window.rootViewController = navigationController
	}
	
	func showLogin() {
		
		if let navigationController = navigationController {
		
			if let viewController = navigationController.topViewController {
				
				LoginRouter.showLoginOnView(viewController, authenticator: FirebaseAuthenticator())
			}
		}
	}
}
