//
//  ValidationTests.swift
//  ValidationTests
//
//  Created by Vitor Natal de Oliveira Campos on 04/03/22.
//

import XCTest
import Presentation

class EmailValidatorAdapterTests: XCTestCase {
    
    func tests_invalid_emails()  {
        let sut = makeSut()
        XCTAssertFalse(sut.isValid(email: "rr"))
        XCTAssertFalse(sut.isValid(email: "rr@"))
        XCTAssertFalse(sut.isValid(email: "rr@rr"))
        XCTAssertFalse(sut.isValid(email: "rr@rr."))
        XCTAssertFalse(sut.isValid(email: "@rr.com"))
    }
    func tests_valid_emails()  {
        let sut = makeSut()
        XCTAssertTrue(sut.isValid(email: "vitor@gmail.com"))
        XCTAssertTrue(sut.isValid(email: "vitor@hotmail.com"))
        XCTAssertTrue(sut.isValid(email: "aiFBQUYDF@adiufgbauyfhi.com.br"))
    }
    
}

extension EmailValidatorAdapterTests {
    func makeSut() -> EmailValidatorAdapter {
        return EmailValidatorAdapter()
    }
}
