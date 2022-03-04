//
//  UIViewControllerExtension.swift
//  IOSUI
//
//  Created by Vitor Natal de Oliveira Campos on 04/03/22.
//

import UIKit

extension UIViewController {
    func hideKeyboardOnTap() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
    @objc private func hideKeyboard () {
        view.endEditing(true)
    }
}
