//
//  WelcomeRouter.swift
//  IOSUI
//
//  Created by Vitor Campos on 18/04/22.
//

import Foundation

public final class WelcomeRouter {
    private let nav: NavigationControllerCustom
    private let loginFactory: () -> LoginViewController
    private let signUpFactory: () -> SignUpViewController
    
    public init(nav: NavigationControllerCustom, loginFactory: @escaping () -> LoginViewController, signUpFactory: @escaping () -> SignUpViewController){
        self.nav = nav
        self.loginFactory = loginFactory
        self.signUpFactory = signUpFactory
    }
    public func goToLogin(){
        nav.pushViewController(loginFactory())
    }
    public func goToSignUp(){
        nav.pushViewController(signUpFactory())
    }
}
