//
//  HomeBookPresenter.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 26/06/23.
//

import Foundation

protocol HomeBookPresenterLogic {
    func onFailure(name: ServiceManagerError)
    func sucessListBook(list: [String : [Books]])
}

final class HomeBookPresenter: HomeBookPresenterLogic {
    
    weak var homeBookViewController: HomeBookViewControllerLogic?
    
    func onFailure(name: ServiceManagerError) {
        homeBookViewController?.onFailure(name: name)
    }
    
    func sucessListBook(list: [String : [Books]]) {
        homeBookViewController?.onListBookLoaded(dic: list)
    }
}
