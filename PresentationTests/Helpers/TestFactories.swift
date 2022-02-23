//
//  TestFactories.swift
//  PresentationTests
//
//  Created by Vitor Natal de Oliveira Campos on 23/02/22.
//

import Foundation
import Presentation

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

func makeSuccessAlertViewModel(message: String) -> AlertViewModel {
    return  AlertViewModel(title: "Success", message: message)
}
