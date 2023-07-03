//
//  ErrorBookViewController.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 28/06/23.
//

import UIKit

protocol ErrorBookViewControllerLogic: AnyObject {
    func displayError(error: ErrorBookSceneModel.LoadData.ViewModel)
}

protocol ErrorViewControllerDelegate: AnyObject {
    func loadingSerivceErrorViewController()
}

final class ErrorBookViewController: UIViewController {
    
    // MARK: - Properties
    
    private let errorBookView = ErrorBookView()
    private let errorBookInteractor: ErrorBookInteractorLogic
    weak var delegate: ErrorViewControllerDelegate?
    
    override func loadView() {
        view = errorBookView
    }
    
    init(errorBookInteractor: ErrorBookInteractorLogic) {
        self.errorBookInteractor = errorBookInteractor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        errorBookInteractor.loadData(data: .init())
        errorBookView.delegate = self
    }
}

// MARK: - ErrorBookViewControllerLogic

extension ErrorBookViewController: ErrorBookViewControllerLogic {
    func displayError(error: ErrorBookSceneModel.LoadData.ViewModel) {
        errorBookView.setup(text: error.error)
    }
}

extension ErrorBookViewController: ErrorViewDelegate {
    func clickButtonUpdateErrorView() {
        delegate?.loadingSerivceErrorViewController()
       dismiss(animated: true)
    }
}
