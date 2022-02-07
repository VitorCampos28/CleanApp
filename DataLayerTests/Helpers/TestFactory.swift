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

func makeError() -> Error {
    return NSError(domain: "any_error", code: 0)
}

func makeHttpResponse(statusCode: Int = 200) -> HTTPURLResponse{
    return  HTTPURLResponse(url: makeURL(), statusCode: statusCode, httpVersion: nil, headerFields: nil)!
}
