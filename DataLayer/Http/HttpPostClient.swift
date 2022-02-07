//
//  HttpPostClient.swift
//  DataLayer
//
//  Created by Vitor Natal de Oliveira Campos on 02/02/22.
//

import Foundation

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
