//
//  WelcomeViewControllerTests.swift
//  CleanApp
//
//  Created by Vitor Campos on 07/04/22.
//

import XCTest
import UIKit
import Presentation
@testable import IOSUI


class WelcomeViewControllerTests: XCTestCase {
    func test_loginButton_calls_login_on_tap() {
        let (sut, buttonSpy) = makeSut()
        sut.loginButton?.simulateTap()
        XCTAssertEqual(buttonSpy.clicks, 1)
    }
    func test_signUpButton_calls_SignUp_on_tap() {
        let (sut, buttonSpy) = makeSut()
        sut.signupButton?.simulateTap()
        XCTAssertEqual(buttonSpy.clicks, 1)
    }
    
}

extension WelcomeViewControllerTests{
    func makeSut() -> (sut: WelcomeViewController, buttonSpy: ButtonSpy) {
        let buttonSpy = ButtonSpy()
        let sut = WelcomeViewController.instantiate()
        sut.login = buttonSpy.onClick
        sut.signUp = buttonSpy.onClick
        sut.loadViewIfNeeded()
        checkMemoryLeak(for: sut)
        return (sut, buttonSpy)
    }
    
    class ButtonSpy {
        var clicks = 0
        func onClick(){
            clicks += 1
        }
    }
}
