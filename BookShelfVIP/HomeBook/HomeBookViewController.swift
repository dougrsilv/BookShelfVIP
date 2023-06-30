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
        let errorBookConfiguration = ErrorBookConfiguration()
        let viewController = errorBookConfiguration.build(serviceManagerError: name.error, delegate: self)
        navigationController?.present(viewController, animated: false)
    }
    
    func onListBookLoaded(dic: HomeBookSceneModel.LoadData.ViewModel) {
        homeBookView.setupData(data: dic.data)
    }
}

// MARK: - SelectBookListCell

extension HomeBookViewController: SelectBookListCell {
    func seleListBook(books: Books) {
        let detailBookConfiguration = DetailBookConfiguration()
        let viewController = detailBookConfiguration.build(books: books)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - ErrorViewControllerDelegate

extension HomeBookViewController: ErrorViewControllerDelegate {
    func loadingSerivceErrorViewController() {
        self.tabBarController?.tabBar.isHidden = false
        homeBookInteractor.fetchListBooks(request: .init())
    }
}
