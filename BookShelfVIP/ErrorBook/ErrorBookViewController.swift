//
//  ErrorBookViewController.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 28/06/23.
//

import UIKit

protocol ErrorBookViewControllerLogic: AnyObject {
    func displayError(error: String)
}

protocol ErrorViewControllerDelegate: AnyObject {
    func loadingSerivceErrorViewController(bool: Bool)
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
        errorBookInteractor.loadData()
        errorBookView.delegate = self
    }
    
    // MARK: - Functions
    
}

// MARK: - ErrorBookViewControllerLogic

extension ErrorBookViewController: ErrorBookViewControllerLogic {
    func displayError(error: String) {
        errorBookView.setup(text: error)
    }
}

extension ErrorBookViewController: ErrorViewDelegate {
    func clickButtonUpdateErrorView() {
        delegate?.loadingSerivceErrorViewController(bool: true)
       dismiss(animated: true)
    }
}
