//
//  ValidationCompositeTests.swift
//  ValidationTests
//
//  Created by Vitor Natal de Oliveira Campos on 22/03/22.
//

import XCTest
import Presentation
import Validation


class ValidationCompositeTests: XCTestCase {
    func test_validate_should_return_error_if_validation_fails () {
        let validationSpy = ValidationSpy()
        let sut = makeSut(validations: [validationSpy])
        validationSpy.simulateError("Error1")
        let errorMessage = sut.validate(data: ["name": "Rodrigo"])
        XCTAssertEqual(errorMessage, "Error1")
    }
    
    func test_validate_should_return_corrext_error_message () {
        let validationSpy2 = ValidationSpy()
        let sut = makeSut(validations: [ValidationSpy(), validationSpy2])
        validationSpy2.simulateError("Error3")
        let errorMessage = sut.validate(data: ["name": "Rodrigo"])
        XCTAssertEqual(errorMessage, "Error3")
    }
    
    func test_validate_should_return_the_first_error_message () {
        let validationSpy2 = ValidationSpy()
        let validationSpy3 = ValidationSpy()
        let sut = makeSut(validations: [ValidationSpy(), validationSpy2, validationSpy3])
        validationSpy2.simulateError("Error2")
        validationSpy3.simulateError("Error3")
        let errorMessage = sut.validate(data: ["name": "Rodrigo"])
        XCTAssertEqual(errorMessage, "Error2")
    }
    
    func test_validate_should_return_nil_if_validation_succeeds () {
        let sut = makeSut(validations: [ValidationSpy(), ValidationSpy()])
        let errorMessage = sut.validate(data: ["name": "Rodrigo"])
        XCTAssertNil(errorMessage)
    }
    func test_validate_should_call_validation_with_correct_data () {
        let validationSpy = ValidationSpy()
        let sut = makeSut(validations: [validationSpy])
        let data = ["name": "Rodrigo"]
        _ = sut.validate(data: data)
        XCTAssertTrue(NSDictionary(dictionary: validationSpy.data!).isEqual(to: data))
    }
}

extension ValidationCompositeTests {
    func makeSut(validations: [ValidationSpy],file: StaticString = #filePath, line: UInt = #line) -> Validation {
        let sut = ValidationComposite(validations: validations)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
