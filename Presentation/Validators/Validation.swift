//
//  Validation.swift
//  Presentation
//
//  Created by Vitor Natal de Oliveira Campos on 21/03/22.
//

public protocol Validation {
    func validate(data: [String: Any]?) -> String?
    
}
