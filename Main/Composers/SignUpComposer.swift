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
public final class SignUpComposer {
    static public func composeControllerWith(addAccount: AddAccount) -> SignUpViewController{
        let controller =  SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let presenter = SignUpPresenter(alertView: WeakVarProxy(controller), emailValidator: emailValidatorAdapter, addAccount: addAccount, loadingView: WeakVarProxy(controller))
        controller.signUp = presenter.signUp
        return controller
    }
}
