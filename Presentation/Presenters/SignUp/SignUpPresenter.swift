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
    private let addAccount: AddAccount
    private let loadingView: LoadingView
    private let validation: Validation
    
    public init(alertView: AlertView, addAccount: AddAccount, loadingView: LoadingView, validation: Validation){
        self.alertView = alertView
        self.addAccount = addAccount
        self.loadingView = loadingView
        self.validation = validation
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        
        if let message = validation.validate(data: viewModel.toJson()) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            loadingView.display(viewModel: LoadingViewModel(isLoading: true))
            addAccount.add(addAccountModel: viewModel.toAddAcountModel()) { [weak self] result in
                guard let self = self else { return }
                self.loadingView.display(viewModel: LoadingViewModel(isLoading: false))
                switch result {
                case .failure(let error):
                    var errorMessage: String!
                    switch error {
                    case .emailInUse:
                        errorMessage =  "Esse e-mail já está em uso"
                    default:
                        errorMessage = "Algo inesperado aconteceu tente novamente em algums instantes"
                    }
                    self.alertView.showMessage(viewModel: AlertViewModel(title: "Error", message: errorMessage))
                case . success:
                    self.alertView.showMessage(viewModel: AlertViewModel(title: "Success", message: "Conta criada com sucesso."))
                }
            }
        }
    }
}
