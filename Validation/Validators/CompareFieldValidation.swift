//
//  CompareFieldValidation.swift
//  Validation
//
//  Created by Vitor Natal de Oliveira Campos on 21/03/22.
//

import Foundation
import Presentation

public final class CompareFieldValidation: Validation, Equatable {
    private let fieldName: String
    private let compareFieldName: String
    private let fieldLabel: String
    
    public init (fieldName: String, fieldLabel: String, compareFieldName: String) {
        self.fieldName = fieldName
        self.fieldLabel = fieldLabel
        self.compareFieldName = compareFieldName
    }
    
    public func validate(data: [String : Any]?) -> String? {
        guard let fieldName = data?[fieldName] as? String, let fieldToCompare = data?[compareFieldName] as? String, fieldName == fieldToCompare else { return "O campo \(fieldLabel) é inválido" }
        return nil
    }
    
    public static func == (lhs: CompareFieldValidation, rhs: CompareFieldValidation) -> Bool {
        return lhs.fieldLabel == rhs.fieldLabel && lhs.fieldName == rhs.fieldName && lhs.compareFieldName == rhs.compareFieldName
    }
}

