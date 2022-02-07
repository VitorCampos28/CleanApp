//
//  TestFactory.swift
//  DataLayerTests
//
//  Created by Vitor Natal de Oliveira Campos on 04/02/22.
//

import Foundation

func makeURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func makeValidData() -> Data {
    return Data("{\"name\": \"Rodrigo\"}".utf8)
}

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}
