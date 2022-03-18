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

public final class MainQueueDispatchDecorator<T> {
    private let instance: T
    public init(_ instance: T){
        self.instance = instance
    }
    
    func dispatch(completion: @escaping () -> Void ){
        guard Thread.isMainThread else { return DispatchQueue.main.async(execute: completion) }
        completion()
    }
}

extension MainQueueDispatchDecorator: AddAccount where T: AddAccount {
    public func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void) {
        instance.add(addAccountModel: addAccountModel) { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}
