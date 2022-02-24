//
//  SignUpViewController.swift
//  IOSUI
//
//  Created by Vitor Natal de Oliveira Campos on 24/02/22.
//

import Foundation
import UIKit
import Presentation

final class SignUpViewController: UIViewController  {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SignUpViewController: LoadingView {
    func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }
    }
}
