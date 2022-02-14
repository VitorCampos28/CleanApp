//
//  EmailValidator.swift
//  Presentation
//
//  Created by Vitor Natal de Oliveira Campos on 14/02/22.
//

import Foundation

public protocol EmailValidator {
    func isValid(email: String) -> Bool
}
