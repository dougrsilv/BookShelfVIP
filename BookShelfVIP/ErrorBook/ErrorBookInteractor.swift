//
//  ErrorBookInteractor.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 28/06/23.
//

import Foundation

protocol ErrorBookInteractorLogic {
    func loadData()
}

final class ErrorBookInteractor: ErrorBookInteractorLogic {
    
    private let errorBookPresenter: ErrorBookPresenterLogic
    private let serviceManagerError: ServiceManagerError
    
    init(errorBookPresenter: ErrorBookPresenterLogic, serviceManagerError: ServiceManagerError) {
        self.errorBookPresenter = errorBookPresenter
        self.serviceManagerError = serviceManagerError
    }
    
    func loadData() {
        errorBookPresenter.presenteFailure(error: serviceManagerError)
    }
}
