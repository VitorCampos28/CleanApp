//
//  NavigationController.swift
//  IOSUI
//
//  Created by Vitor Campos on 01/04/22.
//

import Foundation
import UIKit

public final class NavigationController: UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    public convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    private func setup() {
        let customAppearance = UINavigationBarAppearance()
        customAppearance.configureWithOpaqueBackground()
        customAppearance.backgroundColor = Color.primaryDark
        customAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.standardAppearance = customAppearance
        navigationBar.barStyle = .black
    }
    
    public func setRootViewController(_ viewController: UIViewController) {
        setViewControllers([viewController], animated: true)
    }
    
    public func pushViewController(_ viewController: UIViewController) {
        pushViewController(viewController, animated: true)
    }
}
