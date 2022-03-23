//
//  ApiUrlFactory.swift
//  Main
//
//  Created by Vitor Natal de Oliveira Campos on 23/03/22.
//
import Foundation

func makeApiUrl(path: String) -> URL {
    return URL(string: "\(Enviroment.variable(.apiBaseUrl))/\(path)")!
}

