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
        let homeBookConfiguration = HomeBookConfiguration()
        guard let serviceManager = try? ServiceManager(base: "https://64382d9bf3a0c40814acc039.mockapi.io/devpoli/books") else { return }
        let viewController = homeBookConfiguration.build(service: serviceManager)
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
    }
}
