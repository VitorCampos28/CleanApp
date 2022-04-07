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
    @IBOutlet weak var loginButton: UIButton!
    
    public var signUp: ((SignUpViewModel) -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        title = "4Dev"
        loginButton.layer.cornerRadius = 5
//        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        hideKeyboardOnTap()
    }
    
//    @objc private func saveButtonTapped() {
//        signUp?(SignUpViewModel(name: nameTextField.text, email: emailTextField.text, password: passwordTextField.text, passwordConfirmation: confirmationTextField.text))
//    }
}


//extension SignUpViewController: LoadingView {
//    public func display(viewModel: LoadingViewModel) {
//        if viewModel.isLoading {
//            view.isUserInteractionEnabled = false
//            loadingIndicator.startAnimating()
//        } else {
//            view.isUserInteractionEnabled = true
//            loadingIndicator.stopAnimating()
//        }
//    }
//}
//
//extension SignUpViewController: AlertView {
//    public func showMessage(viewModel: AlertViewModel) {
//        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        present(alert, animated: true)
//    }
//}
