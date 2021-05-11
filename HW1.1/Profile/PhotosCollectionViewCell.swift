//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Кирилл Тила on 15.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: Photos? {
        didSet {
            imagePhoto.image = photo?.photos
        }
    }
    
    private let imagePhoto: UIImageView = {
        let imagePhoto = UIImageView()
        imagePhoto.contentMode = .scaleAspectFill
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        return imagePhoto
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImage(){
        contentView.addSubview(imagePhoto)
        imagePhoto.clipsToBounds = true
        
        let constraints = [
            imagePhoto.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            imagePhoto.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
