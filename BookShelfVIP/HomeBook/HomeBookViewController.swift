//
//  HomeBookViewController.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 25/06/23.
//

import UIKit

protocol HomeBookViewControllerLogic: AnyObject {
    func onFailure(name: ServiceManagerError)
    func onListBookLoaded(dic: [String : [Books]])
}

final class HomeBookViewController: UIViewController {
    
    // MARK: - Properties
    
    private let homeBookView = HomeBookView()
    private let homeBookInteractor: HomeBookInteractorLogic
    
    override func loadView() {
        view = homeBookView
        homeBookInteractor.fetchListBooks()
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
    }
}

// MARK: - HomeBookViewControllerLogic

extension HomeBookViewController: HomeBookViewControllerLogic {
    func onFailure(name: ServiceManagerError) {
        //
    }
    
    func onListBookLoaded(dic: [String : [Books]]) {
        homeBookView.category = dic
        homeBookView.homeTableViewBooks.reloadData()
    }
}

// MARK: - SelectBookListCell

extension HomeBookViewController: SelectBookListCell {
    func seleListBook(books: Books) {
        print(books)
    }
}
