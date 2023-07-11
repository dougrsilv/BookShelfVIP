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
    private let service: ServiceManager
    
    init(navigationController: UINavigationController, book: Books, service: ServiceManager) {
        self.navigationController = navigationController
        self.book = book
        self.service = service
    }
    
    func start() {
        let detailBookConfiguration = DetailBookConfiguration()
        let viewController = detailBookConfiguration.build(books: book, service: service)
        navigationController.pushViewController(viewController, animated: true)
    }
}
