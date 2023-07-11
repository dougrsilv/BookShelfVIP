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
        let viewController = homeBookConfiguration.build(service: serviceManager, coordinator: self)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func startDetailBook(book: Books, service: ServiceManager) {
        let detailBookCoordinator = DetailBookCoordinator(navigationController: navigationController, book: book, service: service)
        detailBookCoordinator.start()
    }
    
    func starErrorBook(name: HomeBookSceneModel.Failure.ViewModel, delegate: ErrorViewControllerDelegate) {
        let errorBookCoordinator = ErrorBookCoordinator(navigationController: navigationController, name: name, delegate: delegate)
        errorBookCoordinator.start()
    }
}
