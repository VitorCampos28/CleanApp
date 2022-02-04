//
//  TextExtensions.swift
//  DataLayerTests
//
//  Created by Vitor Natal de Oliveira Campos on 04/02/22.
//

import Foundation
import XCTest

extension XCTestCase {
    func checkMemoryLeak(for instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, file: file, line: line)
        }
    }
}
