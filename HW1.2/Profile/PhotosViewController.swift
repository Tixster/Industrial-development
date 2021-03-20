//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Кирилл Тила on 14.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

 class PhotosViewController: UIViewController {
    
    private lazy var colletcionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false

    }
    
    private func setupView(){
        view.addSubview(colletcionView)
        title = "Photo Gallery"
        colletcionView.backgroundColor = .white
        
        let constraints = [
            colletcionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            colletcionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            colletcionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            colletcionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoragePhoto.imagePhoto.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PhotosCollectionViewCell  = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! PhotosCollectionViewCell
        
        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    var sideInset: CGFloat { return 8 }
    var middleInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width  - sideInset * 2 - middleInset * 3) / 3 , height: (collectionView.frame.width - sideInset * 2 - middleInset * 3) / 3 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: sideInset, bottom: 8, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let photoCell = cell as? PhotosCollectionViewCell else { return }
        photoCell.photo = StoragePhoto.imagePhoto[indexPath.item]
    }
    
    
}
