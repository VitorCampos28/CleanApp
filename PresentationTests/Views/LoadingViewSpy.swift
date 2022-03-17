//
//  LoadingViewSpy.swift
//  PresentationTests
//
//  Created by Vitor Natal de Oliveira Campos on 23/02/22.
//

import Foundation
import Presentation

class LoadingViewSpy: LoadingView {
    var emit: ((LoadingViewModel) -> Void)?
    
    func observe(completion: @escaping (LoadingViewModel) -> Void) {
        self.emit = completion
    }
    func display(viewModel: LoadingViewModel) {
        self.emit?(viewModel)
    }
}
