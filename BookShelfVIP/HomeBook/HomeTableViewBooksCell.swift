//
//  HomeTableViewBooksCell.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 25/06/23.
//

import UIKit

protocol ListBooksSelect: AnyObject {
    func clickBookSelect(books: Books)
}

final class HomeTableViewBooksCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let collectionBooksCell = "collectionBooksCell"
    var categoryList: [Books] = []
    
    weak var delegate: ListBooksSelect?
    
    private lazy var titleListBook: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = "Drama"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var listBooksCollection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        collection.delegate = self
        collection.dataSource = self
        collection.register(HomeCollectionViewBooksCell.self, forCellWithReuseIdentifier: collectionBooksCell)
        let collectionFlow: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        collectionFlow.scrollDirection = .horizontal
        collection.setCollectionViewLayout(collectionFlow, animated: false)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        contentView.addSubview(titleListBook)
        contentView.addSubview(listBooksCollection)
        
        NSLayoutConstraint.activate([
            titleListBook.topAnchor.constraint(equalTo: contentView.topAnchor, constant:  5),
            titleListBook.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            listBooksCollection.topAnchor.constraint(equalTo: titleListBook.bottomAnchor),
            listBooksCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            listBooksCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            listBooksCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: UICollectionDataSource

extension HomeTableViewBooksCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionBooksCell, for: indexPath) as! HomeCollectionViewBooksCell
        cell.setupData(books: categoryList[indexPath.row])
        titleListBook.text = categoryList[indexPath.row].category
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickBookSelect(books: categoryList[indexPath.row])
    }
}

