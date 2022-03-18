//
//  SignUpComposerTests.swift
//  MainTests
//
//  Created by Vitor Natal de Oliveira Campos on 18/03/22.
//

import Foundation

import XCTest
import Main
import IOSUI

class SignUpComposerTests: XCTestCase {

    func test_background_request_should_complete_on_main_thread() throws {
       let (sut, addAccountSpy) = makeSut()
        sut.loadViewIfNeeded()
    }
}

extension SignUpComposerTests {
    func makeSut(file: StaticString = #file, line: UInt = #line) -> (sut: SignUpViewController, addAccountSpy: AddAccountSpy){
        let addAccountSpy = AddAccountSpy()
        let sut = SignUpComposer.composeControllerWith(addAccount: addAccountSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: addAccountSpy, file: file, line: line)
        return (sut, addAccountSpy)
    }
}
