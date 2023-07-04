//
//  DetailBookCoordinator.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 04/07/23.
//

import UIKit

final class DetailBookCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let book: Books
    
    init(navigationController: UINavigationController, book: Books) {
        self.navigationController = navigationController
        self.book = book
    }
    
    func start() {
        let detailBookConfiguration = DetailBookConfiguration()
        let viewController = detailBookConfiguration.build(books: book)
        navigationController.pushViewController(viewController, animated: true)
    }
}
