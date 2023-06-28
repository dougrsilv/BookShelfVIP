//
//  ErrorBookPresenter.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 28/06/23.
//

import Foundation

protocol ErrorBookPresenterLogic {
    func presenteFailure(error: ServiceManagerError)
}

final class ErrorBookPresenter: ErrorBookPresenterLogic {
    
    weak var errorBookViewController: ErrorBookViewControllerLogic?
    
    func presenteFailure(error: ServiceManagerError) {
        switch error {
        case .decodedError:
            errorBookViewController?.displayError(error: "Error ao decodificar")
        case .network:
            errorBookViewController?.displayError(error: "Falha na Conexão")
        }
    }
}
