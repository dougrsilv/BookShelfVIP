//
//  ErrorBookCoordinator.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 04/07/23.
//

import UIKit

final class ErrorBookCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let name: HomeBookSceneModel.Failure.ViewModel
    private let delegate: ErrorViewControllerDelegate
    
    init(navigationController: UINavigationController, name: HomeBookSceneModel.Failure.ViewModel, delegate: ErrorViewControllerDelegate) {
        self.navigationController = navigationController
        self.name = name
        self.delegate = delegate
    }
    
    func start() {
        let errorBookConfiguration = ErrorBookConfiguration()
        let viewController = errorBookConfiguration.build(serviceManagerError: name.error, delegate: delegate)
        navigationController.present(viewController, animated: false)
    }
}
