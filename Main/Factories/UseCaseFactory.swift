//
//  UseCaseFactory.swift
//  Main
//
//  Created by Vitor Natal de Oliveira Campos on 17/03/22.
//

import Foundation
import DataLayer
import Infra
import Domain

final class UseCaseFactory {
    private static let httpClient = AlamofireAdapter()
    private static let baseURL = Enviroment.variable(.apiBaseUrl)
    
    private static func makeUrl(path: String) -> URL {
        return URL(string: "\(baseURL)/\(path)")!
    }
    
    static func makeRemoteAddAccount() -> AddAccount {
        let remoteAddAcount =  RemoteAddAccount(url: makeUrl(path: "signup"), httpClient: httpClient)
        return MainQueueDispatchDecorator(remoteAddAcount)
    }
}
