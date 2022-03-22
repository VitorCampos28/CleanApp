//
//  RequiredFieldValidationTests.swift
//  ValidationTests
//
//  Created by Vitor Natal de Oliveira Campos on 21/03/22.
//

import XCTest
import Presentation
import Validation

class RequiredFieldValidationTests: XCTestCase {
    func test_validate_should_call_return_error_if_field_is_not_provided(){
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: ["name": "Rodrigo"])
        XCTAssertEqual(errorMessage, "O campo Email é obrigatorio")
    }
    
    func test_validate_should_call_return_error_with_correct_fieldLabel(){
        let sut = makeSut(fieldName: "age", fieldLabel: "Idade")
        let errorMessage = sut.validate(data: ["name": "Rodrigo"])
        XCTAssertEqual(errorMessage, "O campo Idade é obrigatorio")
    }
    
    func test_validate_should_call_return_nil_if_field_is_provided(){
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: ["email": "Rodrigo@gmail.com"])
        XCTAssertNil(errorMessage)
    }
    
    func test_validate_should_call_return_nil_if_no_data_is_provided(){
        let sut = makeSut(fieldName: "email", fieldLabel: "Email")
        let errorMessage = sut.validate(data: nil)
        XCTAssertEqual(errorMessage, "O campo Email é obrigatorio")
    }
}

extension RequiredFieldValidationTests {
    func makeSut(fieldName: String, fieldLabel: String, file: StaticString = #filePath, line: UInt = #line) -> Validation {
        let sut = RequiredFieldValidation(fieldName: fieldName, fieldLabel: fieldLabel)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
