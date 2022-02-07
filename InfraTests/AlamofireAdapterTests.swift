//
//  AlamofireAdapterTests.swift
//  InfraTests
//
//  Created by Vitor Natal de Oliveira Campos on 04/02/22.
//

import XCTest
import Alamofire
import DataLayer

class AlamofireAdapter {
    private let session: Session
    
    init(session: Session = .default){
        self.session = session
    }
    
    func post(to url: URL, with data: Data?, completion: @escaping (Result<Data, HttpError>) -> Void) {
        session.request(url, method: .post, parameters: data?.toJson(), encoding: JSONEncoding.default).responseData { dataResponse in
            guard let _ = dataResponse.response?.statusCode else { return completion(.failure(.noConnectivity)) }
            switch dataResponse.result {
            case .failure: completion(.failure(.noConnectivity))
            case .success(let data):
                completion(.success(data))
            }
        }
    }
}

class AlamofireAdapterTests: XCTestCase {
    func test_post_should_make_request_with_valid_url_and_method() throws {
        let url = makeURL()
        testRequestFor(data: makeValidData()) { request in
            XCTAssertEqual(url, request.url)
            XCTAssertEqual("POST", request.httpMethod)
            XCTAssertNotNil(request.httpBodyStream)
        }
    }
    func test_post_should_complete_with_error_when_request_completes_with_error() throws {
        expectResult(.failure(.noConnectivity), when: (data: nil, response: nil, error: makeError()))
    }
    func test_post_should_complete_with_error_on_all_invalid_cases() throws {
        expectResult(.failure(.noConnectivity), when: (data: makeValidData(), response: makeHttpResponse(), error: makeError()))
        expectResult(.failure(.noConnectivity), when: (data: makeValidData(), response: nil, error: makeError()))
        expectResult(.failure(.noConnectivity), when: (data: makeValidData(), response: nil, error: nil))
        expectResult(.failure(.noConnectivity), when: (data: nil, response: makeHttpResponse(), error: makeError()))
        expectResult(.failure(.noConnectivity), when: (data: nil, response: makeHttpResponse(), error: makeError()))
        expectResult(.failure(.noConnectivity), when: (data: nil, response: nil, error: nil))
    }
}
    //-------------------------------------------------------------------------------------------------------------------------
extension AlamofireAdapterTests {
    func makeSut(file: StaticString = #file, line: UInt = #line) -> AlamofireAdapter {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [UrlProtocolStub.self]
        let session = Session(configuration: configuration)
        let sut = AlamofireAdapter(session: session)
        checkMemoryLeak(for: sut, file: file, line: line)
        return sut
    }
    func testRequestFor(url: URL = makeURL(), data: Data?, action: @escaping (URLRequest) -> Void){
        let sut = makeSut()
        let exp = expectation(description: "Waiting")
        sut.post(to: url, with: data) { _ in
            exp.fulfill()
        }
        var request: URLRequest?
        UrlProtocolStub.observerRequest { request =
            $0
        }
        wait(for: [exp], timeout: 1)
        action(request!)
    }
    
    func expectResult(_ expectedResult: Result<Data, HttpError>, when stub: (data: Data?, response: HTTPURLResponse?, error: Error?), file: StaticString = #file, line: UInt = #line){
        let sut = makeSut()
        UrlProtocolStub.simulate(data: stub.data, response: stub.response, error: stub.error)
        let exp = expectation(description: "Waiting")
        sut.post(to: makeURL(), with: makeValidData()) { recivedResult in
            switch (expectedResult, recivedResult) {
            case (.failure(let expectedError), .failure(let recivedError)): XCTAssertEqual(expectedError, recivedError, file: file, line: line)
            case (.success(let expectedData), .success(let recivedData)): XCTAssertEqual(expectedData, recivedData, file: file, line: line)
            default: XCTFail("Expected \(expectedResult) got \(recivedResult) instead")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)
    }
}

class UrlProtocolStub: URLProtocol {
    static var data: Data?
    static var response: HTTPURLResponse?
    static var error: Error?
    static var emit: ((URLRequest) -> Void)?
    
    static func observerRequest(completion: @escaping (URLRequest) -> Void) {
        UrlProtocolStub.emit = completion
    }
    
    static func simulate(data: Data?, response: HTTPURLResponse?, error: Error?) {
        UrlProtocolStub.data = data
        UrlProtocolStub.response = response
        UrlProtocolStub.error = error
    }
    
    override open class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    override open class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    override open func startLoading() {
        UrlProtocolStub.emit?(request)
        if let data = UrlProtocolStub.data {
            client?.urlProtocol(self, didLoad: data)
        }
        if let response = UrlProtocolStub.response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        if let error = UrlProtocolStub.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        client?.urlProtocolDidFinishLoading(self)
    }
    override open func stopLoading() {}
    
}
