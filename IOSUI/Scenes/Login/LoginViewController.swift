//
//  LoginViewController.swift
//  CleanApp
//
//  Created by Vitor Campos on 07/04/22.

import Foundation
import UIKit
import Presentation

public final class LoginViewController: UIViewController, StoryBoarded  {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: RoundedTextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: RoundedTextField!
    
    public var login: ((LoginRequest) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        title = "4Dev"
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        hideKeyboardOnTap()
    }
    
    @objc private func loginButtonTapped() {
        let viewModel = LoginRequest(email: emailTextField.text, password: passwordTextField.text)
        login?(viewModel)
    }
}


extension LoginViewController: LoadingView {
    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            view.isUserInteractionEnabled = false
            loadingIndicator.startAnimating()
        } else {
            view.isUserInteractionEnabled = true
            loadingIndicator.stopAnimating()
        }
    }
}

extension LoginViewController: AlertView {
    public func showMessage(viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
