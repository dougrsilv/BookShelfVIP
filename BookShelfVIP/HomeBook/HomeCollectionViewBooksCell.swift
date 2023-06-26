//
//  HomeCollectionViewBooksCell.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 26/06/23.
//

import UIKit

final class HomeCollectionViewBooksCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var titleListBook: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Harry Potter"
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageListBook: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .purple
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: - lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    private func setupLayout() {
        addSubview(titleListBook)
        addSubview(imageListBook)
        
        NSLayoutConstraint.activate([
            imageListBook.topAnchor.constraint(equalTo: topAnchor),
            imageListBook.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageListBook.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageListBook.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleListBook.topAnchor.constraint(equalTo: imageListBook.bottomAnchor, constant: 5),
            titleListBook.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleListBook.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func setupData(books: Books) {
        titleListBook.text = books.title
        
        let urlRequest = URLRequest(url: URL(string: books.photo)!)
        URLSession.shared.dataTask(with: urlRequest) { data, result, error in
            let image = UIImage(data: data ?? Data())
            DispatchQueue.main.async {
                self.imageListBook.image = image
            }
        }.resume()
    }
}
