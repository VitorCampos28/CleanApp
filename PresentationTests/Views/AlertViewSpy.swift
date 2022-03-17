//
//  AlertViewSpy.swift
//  PresentationTests
//
//  Created by Vitor Natal de Oliveira Campos on 23/02/22.
//

import Foundation
import Presentation

class AlertViewSpy: AlertView {
    var emit: ((AlertViewModel) -> Void)?
    
    func observe(completion: @escaping (AlertViewModel) -> Void) {
        self.emit = completion
    }
    
    
    func showMessage(viewModel: AlertViewModel) {
        self.emit?(viewModel)
    }
}
