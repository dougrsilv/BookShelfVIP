//
//  DetailBookCommentsDetailCell.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 05/07/23.
//

import UIKit

final class DetailBookCommentsDetailCell: UITableViewCell {
    
    // MARK: - Properties
    
    private let commentsCollectionCell = "commentsCollectionCell"
    private var listComments: [Comments] = []
    
    private lazy var titleDetailBookComments: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Comentários"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var listCollectionDetailBookComments: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.delegate = self
        cv.dataSource = self
        cv.register(CommentsCell.self, forCellWithReuseIdentifier: commentsCollectionCell)
        let cf: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        cf.scrollDirection = .horizontal
        cv.setCollectionViewLayout(cf, animated: false)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
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
        addSubview(titleDetailBookComments)
        contentView.addSubview(listCollectionDetailBookComments)
        
        NSLayoutConstraint.activate([
            titleDetailBookComments.topAnchor.constraint(equalTo: topAnchor),
            titleDetailBookComments.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            listCollectionDetailBookComments.topAnchor.constraint(equalTo: titleDetailBookComments.bottomAnchor, constant: 20),
            listCollectionDetailBookComments.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            listCollectionDetailBookComments.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            listCollectionDetailBookComments.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupDataCommnets(list: [Comments]) {
        listComments = list
        listCollectionDetailBookComments.reloadData()
    }
}

// MARK: - UICollectionViewDataSource

extension DetailBookCommentsDetailCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listComments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: commentsCollectionCell, for: indexPath) as! CommentsCell
        cell.setupData(type: listComments[indexPath.row])
        cell.setupComments(type: listComments[indexPath.row].body)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
    }
}
