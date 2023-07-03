//
//  DetailBookInteractor.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 27/06/23.
//

import Foundation

protocol DetailBookInteractorLogic {
    func loadData(data: DetailBookSceneModel.LoadData.Request)
}

final class DetailBookInteractor: DetailBookInteractorLogic {
    
    private let detailBookPresenter: DetailBookPresenterLogic
    private let books: Books
    
    init(detailBookPresenter: DetailBookPresenterLogic, books: Books) {
        self.detailBookPresenter = detailBookPresenter
        self.books = books
    }
    
    func loadData(data: DetailBookSceneModel.LoadData.Request) {
        detailBookPresenter.detailBook(book: .init(book: books))
    }
    
}
