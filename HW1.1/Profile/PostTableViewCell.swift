//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Кирилл Тила on 03.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private var bgView = UIView()
    
    var post: PostProfile? {
        didSet {
            autorLabel.text = post?.autor
            likesLabel.text = "Likes: \(post?.likes ?? 0)"
            viewsLabel.text = "Views: \(post?.views ?? 0)"
            descriptionLabel.text = post?.description
            imagePost.image = UIImage(named: post?.image ?? "placeholder")
            
        }
    }
    
    private let autorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let imagePost: UIImageView = {
        let imagePost = UIImageView()
        imagePost.contentMode = .scaleAspectFit
        imagePost.backgroundColor = .black
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        
        return imagePost
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupBgView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func  setupBgView() {
        bgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubviews(bgView)
        bgView.addSubviews(autorLabel, likesLabel, viewsLabel, descriptionLabel, imagePost)
        
        setupViews()
        
        let constraints = [
            bgView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            bgView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupViews(){
        
        let constraint = [
            autorLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16),
            autorLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            autorLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: viewsLabel.bottomAnchor),
            
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -16),
            
            imagePost.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 16),
            imagePost.widthAnchor.constraint(equalTo: bgView.widthAnchor),
            imagePost.heightAnchor.constraint(equalTo: imagePost.widthAnchor),
            imagePost.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: 0),
            imagePost.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 0),
        ]
        
        NSLayoutConstraint.activate(constraint)
        
    }
    
}

extension UIView {
    func addSubviews(_ subviews: UIView...){
        subviews.forEach {addSubview($0)}
        
    }
}
