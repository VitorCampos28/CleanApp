//
//  SignUpIntegrationTests.swift
//  MainTests
//
//  Created by Vitor Natal de Oliveira Campos on 17/03/22.
//

import XCTest
import Main

class SignUpIntegrationTests: XCTestCase {

    func test_ui_presentation_integration() throws {
        debugPrint("==========================")
        debugPrint(Enviroment.variable(.apiBaseUrl))
        debugPrint("==========================")
        let sut = SignUpComposer.composeControllerWith(addAccount: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }

}
