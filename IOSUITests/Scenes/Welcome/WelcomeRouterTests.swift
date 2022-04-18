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
        let (sut, nav) = makeSut()
        sut.goToLogin()
        XCTAssertEqual(nav.viewControllers.count, 1)
        XCTAssertTrue(nav.viewControllers[0] is LoginViewController)
    }
}

extension WelcomeRouterTests{
    
    func makeSut() -> (sut: WelcomeRouter, nav: NavigationController) {
        let nav = NavigationController()
        let loginFactorySpy = LoginFactorySpy()
        let sut = WelcomeRouter(nav: nav, loginFactory: loginFactorySpy.makeLogin)
        return (sut, nav)
    }
}

extension WelcomeRouterTests {
    
    class LoginFactorySpy{
        func makeLogin() -> LoginViewController {
            return LoginViewController.instantiate()
        }
    }
}
