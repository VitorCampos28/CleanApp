//
//  UseCaseFactory.swift
//  Main
//
//  Created by Vitor Natal de Oliveira Campos on 17/03/22.
//

import Foundation
import DataLayer
import Domain


func makeRemoteAddAccount() -> AddAccount {
    return makeRemoteAddAccountWith(httpClient: makeAlamofireAdapter())
}

func makeRemoteAddAccountWith(httpClient: HttpPostClient) -> AddAccount {
    let remoteAddAcount =  RemoteAddAccount(url: makeApiUrl(path: "signup"), httpClient: httpClient)
    return MainQueueDispatchDecorator(remoteAddAcount)
}

