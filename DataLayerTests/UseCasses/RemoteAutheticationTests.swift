//
//  RemoteAutheticationTests.swift
//  DataLayerTests
//
//  Created by Vitor Campos on 01/04/22.
//

import XCTest
import Domain
import DataLayer

class RemoteAutheticationTests: XCTestCase {
    
    func test_auth_should_call_httpClient_with_correct_url() {
        let url = makeURL()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.auth(authenticationModel: makeAuthenticationModel()) {_ in}
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    func test_auth_should_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut()
        let authenticationModel = makeAuthenticationModel()
        sut.auth(authenticationModel: authenticationModel) {_ in} 
        XCTAssertEqual(httpClientSpy.data, authenticationModel.toData())
    }
    
    func test_auth_should_complet_with_error_if_client_completes_with_error() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected)) {
            httpClientSpy.completeWithError(.noConnectivity)
        }
    }
    func test_auth_should_complet_with_expired_session_error_if_client_completes_with_unauthorized() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.sessionExpired)) {
            httpClientSpy.completeWithError(.unauthorized)
        }
    }
    func test_add_should_complete_with_account_if_client_completes_with_valid_data() {
        let (sut, httpClientSpy) = makeSut()
        let account = makeAccountModel()
        expect(sut, completeWith: .success(account)) {
            httpClientSpy.completeWithData(account.toData()!)
        }
    }
    func test_add_should_complet_with_error_if_client_completes_with_invalid_data() {
        let (sut, httpClientSpy) = makeSut()
        expect(sut, completeWith: .failure(.unexpected)) {
            httpClientSpy.completeWithData(makeInvalidData())
        }
    }
    func test_add_should_not_complete_if_sut_has_been_deallocated() {
        let httpClienSpy = HttpClientSpy()
        var sut: RemoteAuthentication? = RemoteAuthentication(url: makeURL(), httpClient: httpClienSpy)
        var result: (Authentication.Result)?
        sut?.auth(authenticationModel: makeAuthenticationModel()) { result = $0 }
        sut = nil
        httpClienSpy.completeWithError(.noConnectivity)
        XCTAssertNil(result)
    }
}

extension RemoteAutheticationTests {
    
    func makeSut(url: URL = URL(string: "http://any-url.com")!, file: StaticString = #file, line: UInt = #line) -> (sut: RemoteAuthentication, HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAuthentication(url: url, httpClient: httpClientSpy)
        checkMemoryLeak(for: sut, file: file, line: line)
        checkMemoryLeak(for: httpClientSpy, file: file, line: line)
        return (sut, httpClientSpy)
    }
    func expect(_ sut: RemoteAuthentication, completeWith expectedResult: Authentication.Result, when action: () -> Void,
                file: StaticString = #file, line: UInt = #line){
        let exp = expectation(description: "waiting")
        sut.auth(authenticationModel: makeAuthenticationModel()){ receivedResult in
            switch (expectedResult, receivedResult) {
            case (.failure(let expectedError), .failure(let receivedError)):
                XCTAssertEqual(expectedError, receivedError, file: file, line: line)
            case (.success(let expectedAccount), .success(let receivedAccount)):
                XCTAssertEqual(expectedAccount, receivedAccount, file: file, line: line)
                default:
                    XCTFail("Expected \(expectedResult) received \(receivedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        action()
        wait(for: [exp], timeout: 1)
    }
}
