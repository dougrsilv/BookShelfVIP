//
//  DetailBookConfiguration.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 27/06/23.
//

import UIKit

final class DetailBookConfiguration {
    
    func build(books: Books, service: ServiceManager) -> UIViewController {
        let detailBookPresenter = DetailBookPresenter()
        let detailBookInteractor = DetailBookInteractor(detailBookPresenter: detailBookPresenter, books: books, service: service)
        let detailBookViewController = DetailBookViewController(detailBookIntarctorLogic: detailBookInteractor)
        detailBookPresenter.detailBookViewController = detailBookViewController
        return detailBookViewController
    }
}
