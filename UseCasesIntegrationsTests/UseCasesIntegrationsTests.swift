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
        let url = URL(string: "https://fordevs.herokuapp.com/api/signup")!
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Rodrigo Manguinho", email: "\(UUID().uuidString)@gmail.com", password: "secret", passwordConfirmation: "secret")
        let exp = expectation(description: "Waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure: XCTFail("Expect success got \(result) instead")
            case .success(let account):
                XCTAssertNotNil(account.accessToken)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 20)
        let exp2 = expectation(description: "Waiting")
        sut.add(addAccountModel: addAccountModel) { result in
            switch result {
            case .failure(let error) where error == .emailInUse:
                XCTAssertNotNil(error)
            default:
                XCTFail("Expect success got \(result) instead")
            }
            exp2.fulfill()
        }
        wait(for: [exp2], timeout: 20)
    }
}
