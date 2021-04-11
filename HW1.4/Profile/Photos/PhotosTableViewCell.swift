//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Кирилл Тила on 14.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

@available(iOS 13.0, *)
class PhotosTableViewCell: UITableViewCell {
    
    private var bgView = UIView()
    
    private let arrowImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let photoOne: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "photo1")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }()
    
    private let photoTwo: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "photo2")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }()
    
    private let photoThree: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "photo3")
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill

        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }()
    
    private let photoFour: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "photo4")
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        return photo
    }()
    
    private let photoStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution = UIStackView.Distribution.fillEqually
        stack.alignment = UIStackView.Alignment.center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupBgVIew()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupBgVIew(){
        contentView.addSubview(bgView)
        setupTitle()
        setupStackView()
        
        bgView.snp.makeConstraints({
            $0.width.height.equalToSuperview()
        })
        
    }
    
    private func setupTitle(){
        
        bgView.addSubview(titleLabel)
        bgView.addSubview(arrowImage)
        
        titleLabel.snp.makeConstraints({
            $0.top.leading.equalTo(bgView).offset(12)
        })
        
        arrowImage.snp.makeConstraints({
            $0.trailing.equalTo(bgView).offset(-12)
            $0.centerY.equalTo(titleLabel.snp.centerY)
        })
        
    }
    
    private func setupStackView(){
        photoStackView.addArrangedSubview(photoOne)
        photoStackView.addArrangedSubview(photoTwo)
        photoStackView.addArrangedSubview(photoThree)
        photoStackView.addArrangedSubview(photoFour)
        
        bgView.addSubview(photoStackView)

        photoStackView.snp.makeConstraints({
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalTo(bgView).offset(12)
            $0.trailing.bottom.equalTo(bgView).offset(-12)
        })
        
        photoOne.snp.makeConstraints({
            $0.height.equalTo(contentView.frame.width / 4)
        })
        
        photoTwo.snp.makeConstraints({
            $0.height.equalTo(contentView.frame.width / 4)
        })
        
        photoThree.snp.makeConstraints({
            $0.height.equalTo(contentView.frame.width / 4)
        })
        
        photoFour.snp.makeConstraints({
            $0.height.equalTo(contentView.frame.width / 4)
        })
    }
    
}
