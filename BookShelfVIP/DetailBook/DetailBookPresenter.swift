//
//  DetailBookPresenter.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 27/06/23.
//

import Foundation

protocol DetailBookPresenterLogic {
    func detailBook(book: DetailBookSceneModel.LoadData.Response)
}

final class DetailBookPresenter: DetailBookPresenterLogic {
   
    weak var detailBookViewController: DetailBookViewControllerLogic?
    
    func detailBook(book: DetailBookSceneModel.LoadData.Response) {
        detailBookViewController?.displayBooks(book: .init(title: book.book.title,
                                                           photo: book.book.photo,
                                                           stock: book.book.stock,
                                                           price: formatNumberToDecimal(value: book.book.price),
                                                           author: book.book.author,
                                                           category: book.book.category))
    }
    
    private func formatNumberToDecimal(value: String) -> String {
        let converter = (Double(value) ?? 0) / Double(100)
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "pt_BR")
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: converter)) ?? "Valor indefinido"
    }
}
