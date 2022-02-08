//
//  UseCasesIntegrationsTests.swift
//  UseCasesIntegrationsTests
//
//  Created by Vitor Natal de Oliveira Campos on 08/02/22.
//

import XCTest
import DataLayer
import Domain
import Infra

class UseCasesIntegrationsTests: XCTestCase {

    func test_add_account() throws {
        let alamofireAdapter = AlamofireAdapter()
        let url = URL(string: "https://clean-node-api.herokuapp.com/api/signup")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Paulo Rodrigues", email: "Paulao_R@gmail.com", password: "senhaSecreta", passwordConfirmation: "senhaSecreta")
        let exp = expectation(description: "Waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure: XCTFail("Expect success got \(result) instead")
            case .success(let account):
                XCTAssertNotNil(account.id)
                XCTAssertEqual(account.name, addAccountModel.name)
                XCTAssertEqual(account.email, addAccountModel.email)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5)
    }
}
