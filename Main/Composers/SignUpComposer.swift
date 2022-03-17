//
//  SignUpComposer.swift
//  Main
//
//  Created by Vitor Natal de Oliveira Campos on 17/03/22.
//

import Foundation
import Domain
import IOSUI

public final class SignUpComposer {
    static public func composeControllerWith(addAccount: AddAccount) -> SignUpViewController{
        return ControllerFactory.makeSignUp(addAccount: addAccount)
    }
}
