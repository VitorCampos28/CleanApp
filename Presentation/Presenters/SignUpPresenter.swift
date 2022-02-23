//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Vitor Natal de Oliveira Campos on 14/02/22.
//

import Foundation
import Domain


public final class SignUpPresenter {
    private let alertView: AlertView
    private let emailValidator: EmailValidator
    private let addAccount: AddAccount
    private let loadingView: LoadingView
    
    public init(alertView: AlertView, emailValidator: EmailValidator, addAccount: AddAccount, loadingView: LoadingView){
        self.alertView = alertView
        self.emailValidator = emailValidator
        self.addAccount = addAccount
        self.loadingView = loadingView
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            let addAccountModel = AddAccountModel(name: viewModel.name!, email: viewModel.email!, password: viewModel.password!, passwordConfirmation: viewModel.passwordConfirmation!)
            loadingView.display(viewModel: LoadingViewModel(isLoading: true))
            addAccount.add(addAccountModel: addAccountModel) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .failure:
                    self.alertView.showMessage(viewModel: AlertViewModel(title: "Error", message: "Algo inesperado aconteceu tente novamente em algums instantes"))
                case . success:
                    self.alertView.showMessage(viewModel: AlertViewModel(title: "Success", message: "Conta criada com sucesso."))
                }
                self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
            }
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
            return "Confirmar senha é invalido"
        }else if !emailValidator.isValid(email: viewModel.email!) {
            return "Email é invalido"
        }
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
