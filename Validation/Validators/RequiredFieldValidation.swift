//
//  RequiredFieldValidation.swift
//  Validation
//
//  Created by Vitor Natal de Oliveira Campos on 21/03/22.
//

import Foundation
import Presentation

public final class RequiredFieldValidation: Validation, Equatable {
    
    private let fieldName: String
    private let fieldLabel: String
    
    public init (fieldName: String, fieldLabel: String) {
        self.fieldName = fieldName
        self.fieldLabel = fieldLabel
    }
    
    public func validate(data: [String : Any]?) -> String? {
        guard let fieldName = data?[fieldName] as? String, !fieldName.isEmpty else { return "O campo \(fieldLabel) é obrigatorio" }
        return nil
    }
    
    public static func == (lhs: RequiredFieldValidation, rhs: RequiredFieldValidation) -> Bool {
        return lhs.fieldLabel == rhs.fieldLabel && lhs.fieldName == rhs.fieldName
    }
}
