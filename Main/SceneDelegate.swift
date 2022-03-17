//
//  SceneDelegate.swift
//  Main
//
//  Created by Vitor Natal de Oliveira Campos on 08/03/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = SignUpComposer.composeControllerWith(addAccount: UseCaseFactory.makeRemoteAddAccount())
        window?.makeKeyAndVisible()
    }

}
