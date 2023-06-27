//
//  HomeBookView.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 25/06/23.
//

import UIKit

protocol SelectBookListCell: AnyObject {
    func seleListBook(books: Books)
}

final class HomeBookView: UIView {
    
    // MARK: - Properties
    
    private let homeTableBookCell = "homeTableBookCell"
    var category: [String : [Books]] = [:]
    weak var delegate: SelectBookListCell?
    
    lazy var homeTableViewBooks: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(HomeTableViewBooksCell.self, forCellReuseIdentifier: homeTableBookCell)
        table.rowHeight = 310
        table.allowsSelection = false
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(homeTableViewBooks)
        
        NSLayoutConstraint.activate([
            homeTableViewBooks.topAnchor.constraint(equalTo: topAnchor),
            homeTableViewBooks.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeTableViewBooks.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeTableViewBooks.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension HomeBookView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeTableBookCell, for: indexPath) as! HomeTableViewBooksCell
        let key = Array(category.keys)[indexPath.row]
        cell.categoryList = category[key] ?? []
        cell.delegate = self
        return cell
    }
}

// MARK: - ListBooksSelect

extension HomeBookView: ListBooksSelect {
    func clickBookSelect(books: Books) {
        delegate?.seleListBook(books: books)
    }
}
