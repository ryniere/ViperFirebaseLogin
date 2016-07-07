//
//  ProfileConfigurator.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 05/07/16.
//  Copyright (c) 2016 Ryniere S Silva. All rights reserved.
//
//  Authors:
//    - Guilherme Assis http://github.com/gui-assis
//    - Alan Lira http://github.com/alanmlira

import UIKit

class ProfileModuleConfigurator {

    static func configure(viewController: ProfileViewController) {

        let router = ProfileRouter()

        let presenter = ProfilePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ProfileInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
