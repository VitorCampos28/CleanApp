//
//  SignUpComposer.swift
//  Main
//
//  Created by Vitor Natal de Oliveira Campos on 17/03/22.
//

import Foundation
import Domain
import IOSUI
import Validation
import Presentation
import Infra

public final class SignUpComposer {
    static public func composeControllerWith(addAccount: AddAccount) -> SignUpViewController{
        let controller =  SignUpViewController.instantiate()
        let validationComposite = ValidationComposite(validations: makeValidations())
        let presenter = SignUpPresenter(alertView: WeakVarProxy(controller), addAccount: addAccount, loadingView: WeakVarProxy(controller), validation: validationComposite)
        controller.signUp = presenter.signUp
        return controller
    }
    
    public static func makeValidations() -> [Validation] {
        return [
            RequiredFieldValidation(fieldName: "name", fieldLabel: "Nome"),
            RequiredFieldValidation(fieldName: "email", fieldLabel: "Email"),
            EmailValidation(fieldName: "email", fieldLabel: "Email", emailValidator: EmailValidatorAdapter()),
            RequiredFieldValidation(fieldName: "password", fieldLabel: "Senha"),
            RequiredFieldValidation(fieldName: "passwordConfirmation", fieldLabel: "Confirmar Senha"),
            CompareFieldValidation(fieldName: "password", fieldLabel: "Confirmar Senha", compareFieldName: "passwordConfirmation")

        ]
    }
}
