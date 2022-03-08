//
//  SignUpFactory.swift
//  Main
//
//  Created by Vitor Natal de Oliveira Campos on 08/03/22.
//

import Foundation
import IOSUI
import Presentation
import Validation
import DataLayer
import Infra

class SignUpFactory {
    static func makeController() -> SignUpViewController {
        let controller =  SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://clean-node-api.herokuapp.com/api/signup")!
        let remoteAddAccount = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let presenter = SignUpPresenter(alertView: controller, emailValidator: emailValidatorAdapter, addAccount: remoteAddAccount, loadingView: controller)
        controller.signUp = presenter.signUp
        return controller
    }
}
