//
//  SignUpMapper.swift
//  Presentation
//
//  Created by Vitor Natal de Oliveira Campos on 23/02/22.
//

import Foundation
import Domain

public final class SignUpMapper {
    static func toAddAcountModel(viewModel: SignUpViewModel) -> AddAccountModel {
        return AddAccountModel(name: viewModel.name!, email: viewModel.email!, password: viewModel.password!, passwordConfirmation: viewModel.passwordConfirmation!)
    }
}
