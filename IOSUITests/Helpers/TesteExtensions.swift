//
//  TesteExtensions.swift
//  IOSUITests
//
//  Created by Vitor Natal de Oliveira Campos on 02/03/22.
//

import Foundation
import UIKit

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
