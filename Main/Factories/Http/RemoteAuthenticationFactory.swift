//
//  RemoteAuthenticationFactory.swift
//  Main
//
//  Created by Vitor Campos on 11/04/22.
//


import Foundation
import DataLayer
import Domain



func makeRemoteAuthentication(httpClient: HttpPostClient) -> Authentication {
    let remoteAuthentication = RemoteAuthentication(url: makeApiUrl(path: "login"), httpClient: httpClient)
    return MainQueueDispatchDecorator(remoteAuthentication)
}
