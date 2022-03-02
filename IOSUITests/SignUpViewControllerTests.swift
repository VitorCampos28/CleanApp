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
    func test_saveButton_calls_signUp_on_tap() {
        var callsCount = 0
        let sut = makeSut(signUpSpy: { _ in
            callsCount += 1
        })
        sut.saveButton?.simulateTap()
        XCTAssertEqual(callsCount, 1)
   }

}

extension IOSUITests{
    func makeSut(signUpSpy: ((SignUpViewModel) -> Void)? = nil) -> SignUpViewController {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}

extension UIControl {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
    
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach{ action in
                (target as NSObject).perform(Selector(action))
            }
        }
    }
}
