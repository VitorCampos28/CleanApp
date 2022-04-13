//
//  LoginRequest.swift
//  Presentation
//
//  Created by Vitor Campos on 07/04/22.
//

import Foundation

import Foundation
import Domain

public struct LoginRequest: Model {
    public var email:String?
    public var password: String?
    
    public init(email:String? = nil, password: String? = nil) {
        self.email = email
        self.password = password
    }
    public func toAuthenticationModel() -> AuthenticationModel {
        return AuthenticationModel(email: email!, password: password!)
    }
}
