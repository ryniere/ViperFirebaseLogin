//
//  ProfileProtocols.swift
//  ViperFirebaseLogin
//
//  Created by Ryniere S Silva on 05/07/16.
//  Copyright (c) 2016 Ryniere S Silva. All rights reserved.
//


import Foundation

protocol ProfileViewOutput: class {
    func viewIsReady()
}

protocol ProfileViewInput: class {
    var output: ProfileViewOutput? { get set }
    
    func setupInitialState()
}

protocol ProfileRouterInput: class {
    var view: ProfileViewInput? { get set }
}

protocol ProfileModuleInput: class {
    var view: ProfileViewInput? { get set }
    var interactor: ProfileInteractorInput? { get set }
    var router: ProfileRouterInput? { get set }
}

protocol ProfileInteractorOutput: class {
    
}

protocol ProfileInteractorInput: class {
    var output: ProfileInteractorOutput? { get set }
}