//
//  IOSUITests.swift
//  IOSUITests
//
//  Created by Vitor Natal de Oliveira Campos on 24/02/22.
//

import XCTest
import UIKit
@testable import IOSUI


class IOSUITests: XCTestCase {
     func test_loading_is_disable_on_start() {
         let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
         let sut = sb.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
         sut.loadViewIfNeeded()
         XCTAssertEqual(sut.loadingIndicator?.isAnimating, false)
    }

}
