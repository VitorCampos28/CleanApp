//
//  AuthenticationSpy.swift
//  PresentationTests
//
//  Created by Vitor Campos on 07/04/22.
//

import Foundation
import Domain


class AuthenticationSpy: Authentication {
    var authenticationModel: AuthenticationModel?
    var completion: ((Authentication.Result) -> Void)?
    
    func auth(authenticationModel: AuthenticationModel, completion: @escaping (AddAccount.Result) -> Void) {
        self.authenticationModel = authenticationModel
        self.completion = completion
    }
    func completeWithError(_ error: DomainError) {
        completion?(.failure(error))
    }
    func completeWithAccount(_ account: AccountModel) {
        completion?(.success(account))
    }
}
