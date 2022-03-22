//
//  CompareFieldsValidationTests.swift
//  ValidationTests
//
//  Created by Vitor Natal de Oliveira Campos on 21/03/22.
//

import XCTest
import Presentation
import Validation

class CompareFieldsValidationTests: XCTestCase {
    func test_validate_should_call_return_error_if_comparation_fails(){
        let sut = makeSut(fieldName: "password", compareFieldName: "passwordConfirmation", fieldLabel: "Senha")
        let errorMessage = sut.validate(data: ["password": "123", "passwordConfirmation": "1234"])
        XCTAssertEqual(errorMessage, "O campo Senha é inválido")
    }
    
    func test_validate_should_call_return_error_with_correct_fieldLabel(){
        let sut = makeSut(fieldName: "password", compareFieldName: "passwordConfirmation", fieldLabel: "Confirmar senha")
        let errorMessage = sut.validate(data: ["password": "123", "passwordConfirmation": "1234"])
        XCTAssertEqual(errorMessage, "O campo Confirmar senha é inválido")
    }
    func test_validate_should_call_return_nil_if_comparation_succeeds(){
        let sut = makeSut(fieldName: "password", compareFieldName: "passwordConfirmation", fieldLabel: "Confirmar senha")
        let errorMessage = sut.validate(data: ["password": "123", "passwordConfirmation": "123"])
        XCTAssertNil(errorMessage)
    }
    
    func test_validate_should_call_return_nil_if_no_data_is_provided(){
        let sut = makeSut(fieldName: "password", compareFieldName: "passwordConfirmation", fieldLabel: "Confirmar senha")
        let errorMessage = sut.validate(data: nil)
        XCTAssertEqual(errorMessage, "O campo Confirmar senha é inválido")
    }
}

extension CompareFieldsValidationTests {
    func makeSut(fieldName: String, compareFieldName: String, fieldLabel: String, file: StaticString = #filePath, line: UInt = #line) -> Validation {
        let sut = CompareFieldValidation(fieldName: fieldName, fieldLabel: fieldLabel, compareFieldName: compareFieldName)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
}
