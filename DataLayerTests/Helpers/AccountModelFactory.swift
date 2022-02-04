//
//  AccountModelFactory.swift
//  DataLayerTests
//
//  Created by Vitor Natal de Oliveira Campos on 04/02/22.
//

import Foundation
import Domain

func makeAccountModel() -> AccountModel {
    return AccountModel(id: "any_id", name: "any_name", email: "any_email", password: "any_password")
}
