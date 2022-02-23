//
//  EmailValidatorSpy.swift
//  PresentationTests
//
//  Created by Vitor Natal de Oliveira Campos on 23/02/22.
//

import Foundation
import Presentation

class EmailValidatorSpy: EmailValidator {
    var isValid = true
    var email: String?
    
    func isValid(email: String) -> Bool {
        self.email = email
        return isValid
    }
    func simulateInvalidEmail(){
        isValid = false
    }
}
