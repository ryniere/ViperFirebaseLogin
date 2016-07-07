//
//  ProfilePresenter.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 05/07/16.
//  Copyright (c) 2016 Ryniere S Silva. All rights reserved.
//
//  Authors:
//    - Guilherme Assis http://github.com/gui-assis
//    - Alan Lira http://github.com/alanmlira

class ProfilePresenter: ProfileModuleInput, ProfileViewOutput, ProfileInteractorOutput {

    var view: ProfileViewInput?
    var interactor: ProfileInteractorInput?
    var router: ProfileRouterInput?

    func viewIsReady() {
        
    }
}
