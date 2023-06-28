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
    private var listArrayTitle = [String]()
    private var dictionary: [String: [Books]] = [:]
    private let service: ServiceManager
    
    init(homeBookPresenter: HomeBookPresenterLogic, service: ServiceManager) {
        self.homeBookPresenter = homeBookPresenter
        self.service = service
    }
    
    func removeDuplicates(array: [String]) -> [String] {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value) {
            }
            else {
                encountered.insert(value)
                result.append(value)
            }
        }
        return result
    }
    
    func fetchListBooks() {
        service.get(path: "", type: [Books].self) { [weak self] service in
            guard let self = self else { return }
            switch service {
            case let .failure(erro):
                self.homeBookPresenter.onFailure(name: erro)
            case let .success(service):
                for list in service {
                    self.listArrayTitle.append(list.category)
                }
                
                for newList in  self.removeDuplicates(array:  self.listArrayTitle) {
                    let info = service.filter({ $0.category == newList})
                    self.dictionary[newList] = info
                }
                self.homeBookPresenter.sucessListBook(list: self.dictionary)
            }
        }
    }
}
