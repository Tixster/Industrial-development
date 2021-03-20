//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    let post: Post = Post(title: "Пост")
    
    private var verticalSctackView = UIStackView()
    private var buttomOneSV = UIButton(type: .system)
    private var buttomTwoSV = UIButton(type: .system)
    
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(type(of: self), #function)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(verticalSctackView)
        setupStackView()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(type(of: self), #function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(type(of: self), #function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func setupStackView(){
        verticalSctackView.translatesAutoresizingMaskIntoConstraints = false
        
        verticalSctackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        verticalSctackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        verticalSctackView.axis = .vertical
        verticalSctackView.spacing = 10
        verticalSctackView.distribution = .fillEqually
        
        verticalSctackView.addArrangedSubview(buttomOneSV)
        verticalSctackView.addArrangedSubview(buttomTwoSV)
        
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
        performSegue(withIdentifier: "post", sender: self)
        
        
    }

}
