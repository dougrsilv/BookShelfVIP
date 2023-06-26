//
//  HomeBookInteractor.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 26/06/23.
//

import Foundation

protocol HomeBookInteractorLogic {
    func fetchListBooks()
}

final class HomeBookInteractor: HomeBookInteractorLogic {
    
    private let homeBookPresenter: HomeBookPresenterLogic
    private let service: ServiceManager
    
    init(homeBookPresenter: HomeBookPresenterLogic, service: ServiceManager) {
        self.homeBookPresenter = homeBookPresenter
        self.service = service
    }
    
    func fetchListBooks() {
        service.get(path: "", type: [Books].self) { [weak self] service in
            guard let self = self else { return }
            switch service {
            case let .failure(erro):
                self.homeBookPresenter.onFailure(name: erro)
            case let .success(service):
                self.homeBookPresenter.sucessListBook(List: service)
            }
        }
    }
}
