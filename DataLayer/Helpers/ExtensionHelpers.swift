//
//  ExtensionHelpers.swift
//  DataLayer
//
//  Created by Vitor Natal de Oliveira Campos on 02/02/22.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
