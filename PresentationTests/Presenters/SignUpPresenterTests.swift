
//
//  SignUpPresenterTests.swift
//  PresentationTests
//
//  Created by Vitor Natal de Oliveira Campos on 14/02/22.
//

import XCTest
import Presentation
import Domain

class SignUpPresenterTests: XCTestCase {

    func test_signUp_should_show_error_message_if_name_is_not_provided() throws {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSignUpViewModel(name: nil))
        XCTAssertEqual(alertViewSpy.viewModel, makeRequiredAlertViewModel(fieldName: "Nome"))
    }
    func test_signUp_should_show_error_message_if_email_is_not_provided() throws {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSignUpViewModel(email: nil))
        XCTAssertEqual(alertViewSpy.viewModel, makeRequiredAlertViewModel(fieldName: "Email"))
    }
    func test_signUp_should_show_error_message_if_password_is_not_provided() throws {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSignUpViewModel(password: nil))
        XCTAssertEqual(alertViewSpy.viewModel, makeRequiredAlertViewModel(fieldName: "Senha"))
    }
    func test_signUp_should_show_error_message_if_password_confirmation_is_not_provided() throws {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSignUpViewModel(confirmationPassword: nil))
        XCTAssertEqual(alertViewSpy.viewModel, makeRequiredAlertViewModel(fieldName: "Confirmar senha"))
    }
    func test_signUp_should_show_error_message_if_password_confirmation_not_match() throws {
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy)
        sut.signUp(viewModel: makeSignUpViewModel(confirmationPassword: "wrong_password"))
        XCTAssertEqual(alertViewSpy.viewModel, makeInvalidAlertViewModel(fieldName: "Confirmar senha"))
    }
    func test_signUp_should_show_error_message_if_invalid_email_is_provided() throws {
        let emailValidatorSpy = EmailValidatorSpy()
        let alertViewSpy = AlertViewSpy()
        let sut = makeSut(alertView: alertViewSpy, emailValidator: emailValidatorSpy)
        emailValidatorSpy.simulateInvalidEmail()
        sut.signUp(viewModel: makeSignUpViewModel())
        XCTAssertEqual(alertViewSpy.viewModel, makeInvalidAlertViewModel(fieldName: "Email"))
    }
    func test_signUp_should_show_error_message_if_addAccount_fails() throws {
        let alertViewSpy = AlertViewSpy()
        let addAccountSpy = AddAccountSpy()
        let sut = makeSut(alertView: alertViewSpy, addAccount: addAccountSpy)
        sut.signUp(viewModel: makeSignUpViewModel())
        addAccountSpy.completeWithError(.unexpected)
        XCTAssertEqual(alertViewSpy.viewModel, makeErrorAlertViewModel(message: "Algo inesperado aconteceu tente novamente em algums instantes"))
    }
    func test_signUp_should_call_email_validator_with_corret_email() throws {
        let emailValidatorSpy = EmailValidatorSpy()
        let sut = makeSut(emailValidator: emailValidatorSpy)
        let signUpViewModel = makeSignUpViewModel()
        sut.signUp(viewModel: signUpViewModel)
        XCTAssertEqual(emailValidatorSpy.email, signUpViewModel.email)
    }
    func test_signUp_should_call_addAccount_with_correct_values() throws {
        let addAccountSpy = AddAccountSpy()
        let sut = makeSut(addAccount: addAccountSpy)
        sut.signUp(viewModel: makeSignUpViewModel())
        XCTAssertEqual(addAccountSpy.addAccountModel, makeAddAccountModel())
    }
}

extension SignUpPresenterTests {
    func makeSut(alertView: AlertViewSpy = AlertViewSpy(), emailValidator: EmailValidatorSpy = EmailValidatorSpy(), addAccount: AddAccountSpy = AddAccountSpy())-> SignUpPresenter {
        let sut = SignUpPresenter(alertView: alertView, emailValidator: emailValidator, addAccount: addAccount)
        return (sut)
    }
    func makeSignUpViewModel(name:String? = "any_name", email: String? = "any_email@mail.com", password: String? = "any_password", confirmationPassword: String? = "any_password") -> SignUpViewModel {
        return SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: confirmationPassword)
    }
    
    func makeRequiredAlertViewModel(fieldName: String) -> AlertViewModel {
        return  AlertViewModel(title: "Falha na validação", message: "\(fieldName) é obrigatório")
    }
    
    func makeInvalidAlertViewModel(fieldName: String) -> AlertViewModel {
        return  AlertViewModel(title: "Falha na validação", message: "\(fieldName) é invalido")
    }
    func makeErrorAlertViewModel(message: String) -> AlertViewModel {
        return  AlertViewModel(title: "Error", message: message)
    }
    
    class AlertViewSpy: AlertView {
        var viewModel: AlertViewModel?
        
        func showMessage(viewModel: AlertViewModel) {
            self.viewModel = viewModel
        }
    }
    class EmailValidatorSpy: EmailValidator {
        var isValid = true
        var email: String?
        
        func isValid(email: String) -> Bool {
            self.email = email
            return isValid
        }
        func simulateInvalidEmail(){
            isValid = false
        }
    }
    
    class AddAccountSpy: AddAccount {
        var addAccountModel: AddAccountModel?
        var completion: ((Result<AccountModel, DomainError>) -> Void)?
        
        func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void) {
            self.addAccountModel = addAccountModel
            self.completion = completion
        }
        func completeWithError(_ error: DomainError) {
            completion?(.failure(error))
        }
    }
}
