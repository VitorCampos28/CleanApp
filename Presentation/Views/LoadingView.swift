//
//  LoadingView.swift
//  Presentation
//
//  Created by Vitor Natal de Oliveira Campos on 15/02/22.
//

import Foundation
import SwiftUI

public protocol LoadingView {
    func display(viewModel: LoadingViewModel)
}

public struct LoadingViewModel: Equatable {
    public var isLoading: Bool
    
    public init (isLoading: Bool) {
        self.isLoading = isLoading
    }
}
