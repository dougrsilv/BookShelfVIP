//
//  ErrorBookPresenter.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 28/06/23.
//

import Foundation

protocol ErrorBookPresenterLogic {
    func presenteFailure(error: ErrorBookSceneModel.LoadData.Response)
}

final class ErrorBookPresenter: ErrorBookPresenterLogic {
    
    weak var errorBookViewController: ErrorBookViewControllerLogic?
    
    func presenteFailure(error: ErrorBookSceneModel.LoadData.Response) {
        switch error.error {
        case .decodedError:
            errorBookViewController?.displayError(error: .init(error: "Error ao decodificar"))
        case .network:
            errorBookViewController?.displayError(error: .init(error: "Falha na Conexão"))
        }
    }
}
