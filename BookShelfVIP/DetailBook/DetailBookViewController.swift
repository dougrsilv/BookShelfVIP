//
//  DetailBookViewController.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 27/06/23.
//

import UIKit

protocol DetailBookViewControllerLogic: AnyObject {
    func displayBooks(book: DetailBookSceneModel.LoadData.ViewModel)
    func listComments(list: [Comments])
}

final class DetailBookViewController: UIViewController {
    
    // MARK: - Properties
    
    private let detailBookIntarctorLogic: DetailBookInteractorLogic
    private let detailBookView = DetailBookView()
    
    override func loadView() {
        view = detailBookView
    }
    
    init(detailBookIntarctorLogic: DetailBookInteractorLogic) {
        self.detailBookIntarctorLogic = detailBookIntarctorLogic
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.prefersLargeTitles = false
        detailBookIntarctorLogic.loadData(data: .init())
        detailBookIntarctorLogic.fecthListComments()
    }
}

// MARK: - DetailBookViewControllerLogic

extension DetailBookViewController: DetailBookViewControllerLogic {
    func displayBooks(book: DetailBookSceneModel.LoadData.ViewModel) {
        detailBookView.setupData(data: book)
    }
    
    func listComments(list: [Comments]) {
        detailBookView.setupPassDataComments(list: list)
    }
}
