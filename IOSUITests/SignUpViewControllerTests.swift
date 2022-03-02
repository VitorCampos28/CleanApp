//
//  IOSUITests.swift
//  IOSUITests
//
//  Created by Vitor Natal de Oliveira Campos on 24/02/22.
//

import XCTest
import UIKit
import Presentation
@testable import IOSUI


class IOSUITests: XCTestCase {
     func test_loading_is_disable_on_start() {
         let sut = makeSut()
         XCTAssertEqual(sut.loadingIndicator?.isAnimating, false)
    }
    func test_sut_implements_loadingView() {
        let sut = makeSut()
        XCTAssertNotNil(sut as LoadingView)
   }
    func test_sut_implements_alertView() {
        let sut = makeSut()
        XCTAssertNotNil(sut as AlertView)
   }

}

extension IOSUITests{
    func makeSut() -> SignUpViewController {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        sut.loadViewIfNeeded()
        return sut
    }
}
