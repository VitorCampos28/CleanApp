//
//  LoginControllerFactory.swift
//  Main
//
//  Created by Vitor Campos on 11/04/22.
//
import Foundation
import Domain
import IOSUI
import Validation
import Presentation

public final class LoginControllerFactory {
    

}

public func makeLoginController(authentication: Authentication) -> LoginViewController{
    let controller =  LoginViewController.instantiate()
    let validationComposite = ValidationComposite(validations: makeSignUpValidations())
    let presenter = LoginPresenter(validation: validationComposite, alertView: WeakVarProxy(controller), authentication: authentication, loadingView: WeakVarProxy(controller))
    controller.login = presenter.login
    return controller
}

public func makeLoginValidations() -> [Validation] {
    return [
        RequiredFieldValidation(fieldName: "email", fieldLabel: "Email"),
        EmailValidation(fieldName: "email", fieldLabel: "Email", emailValidator: makeEmailValidatorAdapter()),
        RequiredFieldValidation(fieldName: "password", fieldLabel: "Senha"),
    ]
}
