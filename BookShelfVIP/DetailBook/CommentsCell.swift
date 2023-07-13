//
//  CommentsCell.swift
//  BookShelfVIP
//
//  Created by Douglas  Rodrigues  on 06/07/23.
//

import UIKit

final class CommentsCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private var flowHeightConstraint: NSLayoutConstraint?
    private var explandable = true
    
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
    
    private lazy var moreComments: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ver mais", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(clickeButtonMoreComments), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.background
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        
        addSubview(cardView)
        cardView.addSubview(avaliacaoImageView)
        cardView.addSubview(postTime)
        cardView.addSubview(userPost)
        cardView.addSubview(commentsPost)
        cardView.addSubview(moreComments)
        
        cardView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cardView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cardView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        flowHeightConstraint = cardView.heightAnchor.constraint(equalToConstant: 200)
        flowHeightConstraint?.isActive = true
        
        postTime.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10).isActive = true
        postTime.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        
        avaliacaoImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5).isActive = true
        avaliacaoImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10).isActive = true
        
        userPost.topAnchor.constraint(equalTo: postTime.bottomAnchor, constant: 10).isActive = true
        userPost.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        
        commentsPost.topAnchor.constraint(equalTo: userPost.bottomAnchor, constant: 10).isActive = true
        commentsPost.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10).isActive = true
        commentsPost.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10).isActive = true
        commentsPost.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20).isActive = true
        
        moreComments.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10).isActive = true
        moreComments.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant:  -5).isActive = true
    }
    
    func setupData(type: Comments) {
        userPost.text = type.email
        avaliacaoImageView.image = UIImage(named: String(type.rate))
        commentsPost.text = type.body
        postTime.text = String(type.createdAt)
    }
    
    func setupComments(type: String) {
        let lowerMessage = type.lowercased()
        let lettersCount = lowerMessage.filter(\.isLetter).count
        
        if lettersCount >= 300 {
            moreComments.isHidden = false
        } else if lettersCount < 300  {
            moreComments.isHidden = true
            self.flowHeightConstraint?.constant = 200
            moreComments.setTitle("ver mais", for: .normal)
            explandable = true
        }
    }
    
    @objc func clickeButtonMoreComments() {
        switch explandable {
        case true:
            flowHeightConstraint?.constant = 350
            moreComments.setTitle("ver menos", for: .normal)
            explandable = !explandable
        case false:
            flowHeightConstraint?.constant = 200
            moreComments.setTitle("ver mais", for: .normal)
            explandable = !explandable
        }
    }
}
