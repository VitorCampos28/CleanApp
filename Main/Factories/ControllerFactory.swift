//
//  ControllerFactory.swift
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
import Domain

class ControllerFactory {
    static func makeSignUp(addAccount: AddAccount) -> SignUpViewController {
        let controller =  SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let presenter = SignUpPresenter(alertView: WeakVarProxy(controller), emailValidator: emailValidatorAdapter, addAccount: addAccount, loadingView: WeakVarProxy(controller))
        controller.signUp = presenter.signUp
        return controller
    }
}
