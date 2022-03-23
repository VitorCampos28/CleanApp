//
//  AccountModel.swift
//  Domain
//
//  Created by Vitor Natal de Oliveira Campos on 31/01/22.
//

import Foundation

public struct AccountModel: Model {
    public var accessToken: String
    
    public init(accesToken: String){
        self.accessToken = accesToken
    }
}
