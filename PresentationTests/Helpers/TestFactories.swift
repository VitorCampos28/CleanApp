//
//  TestFactories.swift
//  PresentationTests
//
//  Created by Vitor Natal de Oliveira Campos on 23/02/22.
//

import Foundation
import Presentation

func makeSignUpViewModel(name:String? = "any_name", email: String? = "any_email@mail.com", password: String? = "any_password", confirmationPassword: String? = "any_password") -> SignUpRequest {
    return SignUpRequest(name: name, email: email, password: password, passwordConfirmation: confirmationPassword)
}

func makeLoginViewModel(email: String? = "any_email@mail.com", password: String? = "any_password") -> LoginRequest {
    return LoginRequest(email: email, password: password)
}
