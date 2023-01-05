//
//  SceneDelegate.swift
//  Book Nexus
//
//  Created by Ahmed Yamany on 05/01/2023.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let widowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: widowScene.coordinateSpace.bounds)
        window?.windowScene = widowScene
        window?.rootViewController = LoginViewController()
        window?.makeKeyAndVisible()
    }

}
