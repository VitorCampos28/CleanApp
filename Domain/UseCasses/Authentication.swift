//
//  Authentication.swift
//  Domain
//
//  Created by Vitor Campos on 01/04/22.
//

import Foundation


public protocol Authentication {
    typealias Result = Swift.Result<AccountModel, DomainError>
    func add(authenticationModel: AuthenticationModel, completion: @escaping (Result) -> Void )
}

public struct AuthenticationModel: Model {
    public var email: String
    public var password: String
    
    public init(email: String, password: String){
        self.email = email
        self.password = password
    }
}
