//
//  WelcomeViewController.swift
//  CleanApp
//
//  Created by Vitor Campos on 07/04/22.

import Foundation
import UIKit
import Presentation

public final class WelcomeViewController: UIViewController, StoryBoarded  {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    public var login: (() -> Void)?
    public var signUp: (() -> Void)?
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    private func configure() {
        title = "4Dev"
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signupButton.layer.cornerRadius = 5
        signupButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        login?()
    }
    @objc private func signUpButtonTapped() {
        signUp?()
    }
}
