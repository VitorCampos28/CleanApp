//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Vitor Natal de Oliveira Campos on 14/02/22.
//

import Foundation


public final class SignUpPresenter {
    private let alertView: AlertView
    private let emailValidator: EmailValidator
    
    public init(alertView: AlertView, emailValidator: EmailValidator){
        self.alertView = alertView
        self.emailValidator = emailValidator
    }
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        }
    }
    private func validate(viewModel: SignUpViewModel)-> String? {
        if (viewModel.name == nil || viewModel.name!.isEmpty){
            return "Nome é obrigatório"
        } else if (viewModel.email == nil || viewModel.email!.isEmpty){
            return "Email é obrigatório"
        }else if (viewModel.password == nil || viewModel.password!.isEmpty){
            return "Senha é obrigatório"
        }else if (viewModel.passwordConfirmation == nil || viewModel.passwordConfirmation!.isEmpty){
            return "Confirmar senha é obrigatório"
        }else if (viewModel.password != viewModel.passwordConfirmation){
            return "Confirmar senha e senha não são iguais"
        }
        _ = emailValidator.isValid(email: viewModel.email!)
        return nil
    }
}

public struct SignUpViewModel {
    public var name: String?
    public var email:String?
    public var password: String?
    public var passwordConfirmation: String?
    
    public init(name: String? = nil, email:String? = nil, password: String? = nil, passwordConfirmation: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
