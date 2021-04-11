//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

protocol FeedViewOutput {
    func showPost(post: Post)
    var navigationController: UINavigationController? { get set}
}

final class FeedViewController: UIViewController {
        
    private var output: FeedViewOutput?
    
    private lazy var containerView: UIStackView = {
        var stack = ContainerView()
        stack.onTap = output?.showPost(post: )
        return stack
    }()
    
    init(output: FeedViewOutput){
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(type(of: self), #function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.navigationController = navigationController
        view.addSubview(containerView)
        setupContainerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        print(type(of: self), #function)
    }

    private func setupContainerView(){
        containerView.snp.makeConstraints({
            $0.centerX.centerY.equalToSuperview()
        })
    }
    
}


class ContainerView: UIStackView {
    
    let post: Post = Post(title: "Пост")
    
    var onTap: ((Post) -> Void)?
    
    private var buttomOneSV = UIButton(type: .system)
    private var buttomTwoSV = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView(){
        self.axis = .vertical
        self.spacing = 10
        self.distribution = .fillEqually
        
        self.addArrangedSubview(buttomOneSV)
        self.addArrangedSubview(buttomTwoSV)
        
        setupButtomOne()
        setupButtomTwo()
    }
    
    func setupButtomOne(){
        buttomOneSV.setTitle("Кнопка 1", for: .normal)
        buttomOneSV.backgroundColor = .blue
        buttomOneSV.setTitleColor(.white, for: .normal)
        buttomOneSV.addTarget(self, action: #selector(openPost), for: UIControl.Event.touchUpInside)

    }
    
    func setupButtomTwo(){
        buttomTwoSV.setTitle("Кнопка 2", for: .normal)
        buttomTwoSV.backgroundColor = .darkGray
        buttomTwoSV.setTitleColor(.white, for: .normal)
        
        buttomTwoSV.addTarget(self, action: #selector(openPost), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func openPost(){
        guard let onTap = onTap else { return }
        onTap(post)
    }

}

class PostPresenter: FeedViewOutput {
    var navigationController: UINavigationController?

    func showPost(post: Post) {
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
    
}
