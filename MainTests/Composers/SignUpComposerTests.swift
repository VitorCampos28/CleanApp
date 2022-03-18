//
//  SignUpComposerTests.swift
//  MainTests
//
//  Created by Vitor Natal de Oliveira Campos on 18/03/22.
//

import Foundation

import XCTest
import Main

class SignUpComposerTests: XCTestCase {

    func test_ui_presentation_integration() throws {
        let sut = SignUpComposer.composeControllerWith(addAccount: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }
}
