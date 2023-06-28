//
//  ErrorBookConfiguration.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 28/06/23.
//

import UIKit

final class ErrorBookConfiguration {
    
    func build(serviceManagerError: ServiceManagerError, delegate: ErrorViewControllerDelegate) -> UIViewController{
        let errorBookPresenter = ErrorBookPresenter()
        let errorBookInteractor = ErrorBookInteractor(errorBookPresenter: errorBookPresenter, serviceManagerError: serviceManagerError)
        let errorBookViewController = ErrorBookViewController(errorBookInteractor: errorBookInteractor)
        errorBookViewController.delegate = delegate
        errorBookViewController.modalPresentationStyle = .fullScreen
        errorBookPresenter.errorBookViewController = errorBookViewController
        return errorBookViewController
    }
}
