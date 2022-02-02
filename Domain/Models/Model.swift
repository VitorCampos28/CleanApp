//
//  Model.swift
//  Domain
//
//  Created by Vitor Natal de Oliveira Campos on 02/02/22.
//

import Foundation

public protocol Model: Codable, Equatable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
