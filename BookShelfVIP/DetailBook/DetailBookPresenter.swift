//
//  DetailBookPresenter.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 27/06/23.
//

import Foundation

protocol DetailBookPresenterLogic {
    func detailBook(book: Books)
}

final class DetailBookPresenter: DetailBookPresenterLogic {
   
    weak var detailBookViewController: DetailBookViewControllerLogic?
    
    func detailBook(book: Books) {
        let model = Books(title: book.title,
                          author: book.author,
                          photo: book.photo,
                          isHighlight: book.isHighlight,
                          stock: book.stock,
                          price: formatNumberToDecimal(value: book.price),
                          category: book.category,
                          id: book.id)
        
        detailBookViewController?.displayBooks(book: model)
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
