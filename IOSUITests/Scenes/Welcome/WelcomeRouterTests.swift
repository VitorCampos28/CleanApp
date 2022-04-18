//
//  WelcomeRouterTests.swift
//  IOSUITests
//
//  Created by Vitor Campos on 14/04/22.
//

import XCTest
import UIKit
@testable import IOSUI

class WelcomeRouter {
    private let nav: NavigationController
    private let loginFactory: () -> LoginViewController
    
    public init(nav: NavigationController, loginFactory: @escaping () -> LoginViewController){
        self.nav = nav
        self.loginFactory = loginFactory
    }
    public func goToLogin(){
        nav.pushViewController(loginFactory())
    }
}


class WelcomeRouterTests: XCTestCase {
    func test_go_to_login_calls_nav_with_correct_vc() {
        let nav = NavigationController()
        let loginFactorySpy = LoginFactorySpy()
        let sut = WelcomeRouter(nav: nav, loginFactory: loginFactorySpy.makeLogin)
        sut.goToLogin()
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is LoginViewController)
    }
    
    class LoginFactorySpy{
        func makeLogin() -> LoginViewController {
            return LoginViewController.instantiate()
        }
    }
}
