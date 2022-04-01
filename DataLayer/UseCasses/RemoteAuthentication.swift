//
//  RemoteAuthentication.swift
//  DataLayer
//
//  Created by Vitor Campos on 01/04/22.
//
import Foundation
import Domain

public final class RemoteAuthentication {
    private let url: URL
    private let httpClient: HttpPostClient
    
    public init (url: URL, httpClient: HttpPostClient) {
        self.url = url
        self.httpClient = httpClient
    }
    public func auth() {
        httpClient.post(to: url, with: nil) { _ in
            
        }
    }
    
}

