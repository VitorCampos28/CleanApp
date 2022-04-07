//
//  LoginPresenter.swift
//  Presentation
//
//  Created by Vitor Campos on 07/04/22.
//

import Foundation

import Foundation
import Domain


public final class LoginPresenter {
    private let validation: Validation
    
    public init(validation: Validation){
        self.validation = validation
    }
    
    public func login(viewModel: SignUpViewModel) {
       _ = validation.validate(data: viewModel.toJson())
    }
}
