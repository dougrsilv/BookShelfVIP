//
//  HomeBookCoordinator.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 04/07/23.
//

import UIKit

final class HomeBookCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeBookConfiguration = HomeBookConfiguration()
        guard let serviceManager = try? ServiceManager(base: "https://64382d9bf3a0c40814acc039.mockapi.io/devpoli/books") else { return }
        let viewController = homeBookConfiguration.build(service: serviceManager)
        navigationController.setViewControllers([viewController], animated: false)
    }
}
