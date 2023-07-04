//
//  AppCoordinator.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 04/07/23.
//

import UIKit

protocol Coordinator {
    func start()
}

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let homeBookCoordinator = HomeBookCoordinator(navigationController: navigationController)
        homeBookCoordinator.start()
        window.rootViewController =  navigationController
        window.makeKeyAndVisible()
    }
}
