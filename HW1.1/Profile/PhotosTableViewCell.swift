//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Кирилл Тила on 14.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

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
        bgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bgView)
        setupTitle()
        setupStackView()
        
        let constraint = [
            bgView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            bgView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func setupTitle(){
        
        bgView.addSubview(titleLabel)
        bgView.addSubview(arrowImage)
        let constraint = [
            titleLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant:  12),
            
            arrowImage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12),
            arrowImage.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraint)
        
    }
    
    private func setupStackView(){
        photoStackView.addArrangedSubview(photoOne)
        photoStackView.addArrangedSubview(photoTwo)
        photoStackView.addArrangedSubview(photoThree)
        photoStackView.addArrangedSubview(photoFour)
        
        bgView.addSubview(photoStackView)

        
        let constraint = [
            photoStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photoStackView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant:  12),
            photoStackView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -12),
            photoStackView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -12),
            
       //     photoOne.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            photoOne.heightAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            
         //   photoTwo.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            photoTwo.heightAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            
          //  photoThree.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            photoThree.heightAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            
           // photoFour.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            photoFour.heightAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            
        ]
        
        NSLayoutConstraint.activate(constraint)
        
    }
    
}
