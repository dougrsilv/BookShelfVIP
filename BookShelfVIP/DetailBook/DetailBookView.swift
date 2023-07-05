//
//  DetailBookView.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 27/06/23.
//

import UIKit

final class DetailBookView: UIView {
    
    // MARK: - Properties
    
    private let headerCell = "headerCell"
    private let detailCell = "detailCell"
    private var selectBook: DetailBookSceneModel.LoadData.ViewModel?
    
    private lazy var tableViewDetailBook: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(DetailBookBuyCell.self, forCellReuseIdentifier: headerCell)
        table.register(DetailBookDetailCell.self, forCellReuseIdentifier: detailCell)
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
        addSubview(tableViewDetailBook)
        
        NSLayoutConstraint.activate([
            tableViewDetailBook.topAnchor.constraint(equalTo: topAnchor),
            tableViewDetailBook.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableViewDetailBook.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableViewDetailBook.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupData(data: DetailBookSceneModel.LoadData.ViewModel?) {
        selectBook = data
    }
}

// MARK: - UITableViewDataSource

extension DetailBookView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: headerCell, for: indexPath) as! DetailBookBuyCell
            cell.minHeight = 220
            
            if let selectBook = selectBook {
                cell.setupData(books: selectBook)
            }
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: detailCell, for: indexPath) as! DetailBookDetailCell
            
            if let selectBook = selectBook {
                cell.setupData(books: selectBook)
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.item {
        case 0:
            return UITableView.automaticDimension
        case 1:
            return CGFloat(130)
        default:
            break
        }
        return CGFloat(0)
    }
}
