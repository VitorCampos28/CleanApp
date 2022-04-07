//
//  LoginPresenterTests.swift
//  PresentationTests
//
//  Created by Vitor Campos on 07/04/22.
//

import Foundation

import XCTest
import Presentation
import Domain

class LoginPresenterTests: XCTestCase {
    func test_signUp_should_call_validation_with_correct_values(){
        let validationSpy = ValidationSpy()
        let sut = makeSut(validation: validationSpy)
        let viewModel = makeLoginViewModel()
        sut.signUp(viewModel:  viewModel)
        XCTAssertTrue(NSDictionary(dictionary:  validationSpy.data!).isEqual(to: viewModel.toJson()!))
    }
}

extension LoginPresenterTests {
    func makeSut(validation: ValidationSpy = ValidationSpy() , file: StaticString = #file, line: UInt = #line)-> LoginPresenter {
        let sut = LoginPresenter(validation: validation)
        checkMemoryLeak(for: sut, file: file, line: line)
        return (sut)
    }
}


