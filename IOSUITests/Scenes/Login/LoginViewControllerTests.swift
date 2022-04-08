//
//  LoginViewControllerTests.swift
//  CleanApp
//
//  Created by Vitor Campos on 07/04/22.
//

import XCTest
import UIKit
import Presentation
@testable import IOSUI


class LoginViewControllerTests: XCTestCase {
    func test_loading_is_disable_on_start() {
        let sut = makeSut()
        XCTAssertEqual(sut.loadingIndicator?.isAnimating, false)
    }
    
    func test_sut_implements_loadingView() {
        let sut = makeSut()
        XCTAssertNotNil(sut as LoadingView)
    }
        func test_sut_implements_alertView() {
            let sut = makeSut()
            XCTAssertNotNil(sut as AlertView)
       }
        func test_loginButton_calls_signUp_on_tap() {
            var loginViewModel: LoginViewModel?
            let sut = makeSut(loginSpy: { loginViewModel = $0 })
            sut.loginButton?.simulateTap()
            let email = sut.emailTextField.text
            let password = sut.passwordTextField.text
            XCTAssertEqual(loginViewModel, LoginViewModel(email: email, password: password))
       }
    
}

extension LoginViewControllerTests{
    func makeSut(loginSpy: ((LoginViewModel) -> Void)? = nil) -> LoginViewController {
        let sut = LoginViewController.instantiate()
        sut.login = loginSpy
        checkMemoryLeak(for: sut)
        sut.loadViewIfNeeded()
        return sut
    }
}
