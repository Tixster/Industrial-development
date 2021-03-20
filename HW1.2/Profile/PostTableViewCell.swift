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
        
        contentView.addSubviews(bgView)
        bgView.addSubviews(autorLabel, likesLabel, viewsLabel, descriptionLabel, imagePost)
        
        setupViews()
        
        bgView.snp.makeConstraints({
            $0.width.height.equalToSuperview()
        })

    }
    
    private func setupViews(){
        
        autorLabel.snp.makeConstraints({
            $0.top.leading.equalTo(bgView).offset(16)
            $0.trailing.equalTo(bgView).offset(-16)
        })
        
        descriptionLabel.snp.makeConstraints({
            $0.top.equalTo(imagePost.snp.bottom).offset(16)
            $0.leading.equalTo(bgView).offset(16)
            $0.trailing.equalTo(bgView).offset(-16)
        })
        
        likesLabel.snp.makeConstraints({
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            $0.leading.equalTo(bgView).offset(16)
            $0.bottom.equalTo(viewsLabel)
        })
        
        viewsLabel.snp.makeConstraints({
            $0.top.equalTo(likesLabel)
            $0.trailing.bottom.equalTo(bgView).offset(-16)
        })
        
        imagePost.snp.makeConstraints({
            $0.top.equalTo(autorLabel.snp.bottom).offset(16)
            $0.width.trailing.leading.equalTo(bgView)
            $0.height.equalTo(imagePost)
            
        })
        
    }
    
}

extension UIView {
    func addSubviews(_ subviews: UIView...){
        subviews.forEach {addSubview($0)}
        
    }
}
