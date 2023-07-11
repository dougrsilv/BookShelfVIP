//
//  CommentsCell.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 06/07/23.
//

import UIKit

protocol CommentsCellDelegate: AnyObject {
    func clickExpandableTouch(indexPath: IndexPath)
}

final class CommentsCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    weak var delegate: CommentsCellDelegate?
    
    var indexPath: IndexPath?
    
    private lazy var avaliacaoImageView: UIImageView = {
        let image = UIImageView()
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        image.heightAnchor.constraint(equalToConstant: 24).isActive = true
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "avaliacao-5")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var postTime: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "10/10/20222 19:00:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "teste@teste.com.br"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var commentsPost: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var moreComments: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ver mais", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(clickeButtonMoreComments), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Fuctions
    
    private func setupLayout() {
        backgroundColor = UIColor.background
        layer.cornerRadius = 12
        layer.masksToBounds = true
        clipsToBounds = true
        
        addSubview(avaliacaoImageView)
        addSubview(postTime)
        addSubview(userPost)
        addSubview(commentsPost)
        addSubview(moreComments)
        
        NSLayoutConstraint.activate([
            postTime.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            postTime.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            avaliacaoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            avaliacaoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            userPost.topAnchor.constraint(equalTo: postTime.bottomAnchor, constant: 10),
            userPost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            
            commentsPost.topAnchor.constraint(equalTo: userPost.bottomAnchor, constant: 10),
            commentsPost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            commentsPost.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            moreComments.trailingAnchor.constraint(equalTo: trailingAnchor),
            moreComments.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setupData(type: Comments) {
        userPost.text = type.email
        avaliacaoImageView.image = UIImage(named: String(type.rate))
        commentsPost.text = type.body
        postTime.text = String(type.createdAt)
    }
    
    @objc func clickeButtonMoreComments() {
        delegate?.clickExpandableTouch(indexPath: indexPath ?? IndexPath.init())
    }
}
