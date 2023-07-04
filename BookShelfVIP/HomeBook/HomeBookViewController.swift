//
//  HomeBookViewController.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 25/06/23.
//

import UIKit

protocol HomeBookViewControllerLogic: AnyObject {
    func onFailure(name: HomeBookSceneModel.Failure.ViewModel)
    func onListBookLoaded(dic: HomeBookSceneModel.LoadData.ViewModel)
}

final class HomeBookViewController: UIViewController {
    
    // MARK: - Properties
    
    private let homeBookView = HomeBookView()
    private let homeBookInteractor: HomeBookInteractorLogic
    var homeBookCoordinator: HomeBookCoordinator?
    
    override func loadView() {
        view = homeBookView
        homeBookInteractor.fetchListBooks(request: .init())
    }
    
    init(homeBookInteractor: HomeBookInteractorLogic) {
        self.homeBookInteractor = homeBookInteractor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeBookView.delegate = self
        title = "Livros"
    }
}

// MARK: - HomeBookViewControllerLogic

extension HomeBookViewController: HomeBookViewControllerLogic {
    func onFailure(name: HomeBookSceneModel.Failure.ViewModel) {
        homeBookCoordinator?.starErrorBook(name: name, delegate: self)
    }
    
    func onListBookLoaded(dic: HomeBookSceneModel.LoadData.ViewModel) {
        homeBookView.setupData(data: dic.data)
    }
}

// MARK: - SelectBookListCell

extension HomeBookViewController: SelectBookListCell {
    func seleListBook(books: Books) {
        homeBookCoordinator?.startDetailBook(book: books)
    }
}

// MARK: - ErrorViewControllerDelegate

extension HomeBookViewController: ErrorViewControllerDelegate {
    func loadingSerivceErrorViewController() {
        self.tabBarController?.tabBar.isHidden = false
        homeBookInteractor.fetchListBooks(request: .init())
    }
}
