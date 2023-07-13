//
//  DetailBookInteractor.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 27/06/23.
//

import Foundation

protocol DetailBookInteractorLogic {
    func loadData(data: DetailBookSceneModel.LoadData.Request)
    func fecthListComments(data: DetailBookSceneModel.LoadDataComments.Request)
}

final class DetailBookInteractor: DetailBookInteractorLogic {
    
    private let detailBookPresenter: DetailBookPresenterLogic
    private let books: Books
    private let service: ServiceManager
    
    init(detailBookPresenter: DetailBookPresenterLogic, books: Books, service: ServiceManager) {
        self.detailBookPresenter = detailBookPresenter
        self.books = books
        self.service = service
    }
    
    func loadData(data: DetailBookSceneModel.LoadData.Request) {
        detailBookPresenter.detailBook(book: .init(book: books))
    }
    
    private func captureIdBookAndConverterInt() -> Int {
        guard let converver = Int(books.id) else { return 0 }
        return converver
    }
    
    func fecthListComments(data: DetailBookSceneModel.LoadDataComments.Request) {
        service.get(path: "/\(captureIdBookAndConverterInt())/Comments", type: [Comments].self) { [weak self] service in
            guard let self = self else  { return }
                switch service {
                case let .failure(erro):
                    print(erro)
                case let .success(listComments):
                    self.detailBookPresenter.commentsBook(comments: .init(comments: listComments))
            }
        }
    }
}
