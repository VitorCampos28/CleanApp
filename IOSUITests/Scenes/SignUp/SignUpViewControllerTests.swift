//
//  IOSUITests.swift
//  IOSUITests
//
//  Created by Vitor Natal de Oliveira Campos on 24/02/22.
//

import XCTest
import UIKit
import Presentation
@testable import IOSUI


class IOSUITests: XCTestCase {
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
    func test_saveButton_calls_signUp_on_tap() {
        var signUpViewModel: SignUpViewModel?
        let sut = makeSut(signUpSpy: { signUpViewModel = $0 })
        sut.saveButton?.simulateTap()
        let name = sut.nameTextField.text
        let email = sut.emailTextField.text
        let password = sut.passwordTextField.text
        let confirmation = sut.confirmationTextField.text
        XCTAssertEqual(signUpViewModel, SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: confirmation))
   }

}

extension IOSUITests{
    func makeSut(signUpSpy: ((SignUpViewModel) -> Void)? = nil) -> SignUpViewController {
        let sut = SignUpViewController.instantiate()
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}
