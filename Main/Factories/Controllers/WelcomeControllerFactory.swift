//
//  WelcomeControllerFactory.swift
//  Main
//
//  Created by Vitor Campos on 18/04/22.
//

import Foundation
import IOSUI

public func makeWelcomeController(nav: NavigationControllerCustom) -> WelcomeViewController {
    let router = WelcomeRouter(nav: nav, loginFactory: makeLoginController, signUpFactory: makeSignUpController)
    let controller = WelcomeViewController.instantiate()
    controller.login = router.goToLogin
    controller.signUp = router.goToSignUp
    return controller
}
