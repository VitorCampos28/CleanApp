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
    
    func test_add_should_call_httpClient_with_correct_url() {
        let url = makeURL()
        let (sut, httpClientSpy) = makeSut(url: url)
        sut.auth(authenticationModel: makeAuthenticationModel())
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    func test_add_should_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSut()
        let authenticationModel = makeAuthenticationModel()
        sut.auth(authenticationModel: authenticationModel)
        XCTAssertEqual(httpClientSpy.data, authenticationModel.toData())
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
    
}
