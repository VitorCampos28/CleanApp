//
//  SceneDelegate.swift
//  Main
//
//  Created by Vitor Natal de Oliveira Campos on 08/03/22.
//

import UIKit
import IOSUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let nav = NavigationController()
        let httpClient = makeAlamofireAdapter()
        let addAccount = makeRemoteAddAccount(httpClient: httpClient)
        let signUpController = makeSignUpController(addAccount: addAccount)
        nav.navigationBar.isHidden = false
        nav.setRootViewController(signUpController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

}

