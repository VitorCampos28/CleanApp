//
//  ValidationTests.swift
//  ValidationTests
//
//  Created by Vitor Natal de Oliveira Campos on 04/03/22.
//

import XCTest
import Presentation

public final class EmailValidatorAdapter: EmailValidator {
    private let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    public func isValid(email: String) -> Bool {
        let range = NSRange(location: 0, length: email.utf16.count)
        let regex = try! NSRegularExpression(pattern: pattern)
        return regex.firstMatch(in: email, options: [], range: range) != nil
    }
}

class ValidationTests: XCTestCase {
    
    func tests_invalid_emails()  {
        let sut = EmailValidatorAdapter()
        XCTAssertFalse( sut.isValid(email: "rr"))
        XCTAssertFalse( sut.isValid(email: "rr@"))
        XCTAssertFalse( sut.isValid(email: "rr@rr"))
        XCTAssertFalse( sut.isValid(email: "rr@rr."))
        XCTAssertFalse( sut.isValid(email: "@rr.com"))
    }
    func tests_valid_emails()  {
        let sut = EmailValidatorAdapter()
        XCTAssertTrue( sut.isValid(email: "vitor@gmail.com"))
        XCTAssertTrue( sut.isValid(email: "vitor@hotmail.com"))
        XCTAssertTrue( sut.isValid(email: "aiFBQUYDF@adiufgbauyfhi.com.br"))
    }
    
}
