//
//  HomeBookPresenter.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 26/06/23.
//

import Foundation

protocol HomeBookPresenterLogic {
    func onFailure(name: HomeBookSceneModel.Failure.Response)
    func sucessListBook(response: HomeBookSceneModel.LoadData.Response)
}

final class HomeBookPresenter: HomeBookPresenterLogic {
    
    weak var homeBookViewController: HomeBookViewControllerLogic?
    
    func onFailure(name: HomeBookSceneModel.Failure.Response) {
        homeBookViewController?.onFailure(name: .init(error: name.error))
    }
    
    func sucessListBook(response: HomeBookSceneModel.LoadData.Response) {
        homeBookViewController?.onListBookLoaded(dic: .init(data: response.data))
    }
}
