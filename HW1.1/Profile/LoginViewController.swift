//
//  LoginViewController.swift
//  Navigation
//
//  Created by Кирилл Тила on 02.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var accentColor = UIColor(named: "ColorSet")
    private var imageLogo = UIImageView(image: #imageLiteral(resourceName: "logo"))
    private var stackView = UIStackView()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private var bgTextField = UIView()
    private var line = UIView()
    private var contetnView = UIView()
    private var scrollView = UIScrollView()
    private var buttonLogin = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupScrollView()
    }
    
    // MARK: - ScrollView
    
    func setupScrollView(){

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        setupContentView()

        let constraints = [
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: - Content
    
    private func setupContentView(){
        contetnView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contetnView)

        setupImageLogo()
        setupBgTextField()
        setupButtonLogin()
        
        contetnView.backgroundColor = .white
        
    
        let constraints = [
            
            contetnView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contetnView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contetnView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contetnView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contetnView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        ]
    
        NSLayoutConstraint.activate(constraints)

    }
    
    //MARK: - Logo
    private func setupImageLogo() {
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        contetnView.addSubview(imageLogo)


        let constraints = [
            imageLogo.topAnchor.constraint(equalTo: contetnView.topAnchor, constant: 120),
            imageLogo.centerXAnchor.constraint(equalTo: contetnView.centerXAnchor),
            imageLogo.widthAnchor.constraint(equalToConstant: 100),
            imageLogo.heightAnchor.constraint(equalToConstant: 100)

        ]
        NSLayoutConstraint.activate(constraints)
    }

    //MARK: - Container Text Field
    private func setupBgTextField(){
        contetnView.addSubview(bgTextField)

        bgTextField.addSubview(emailTextField)
        bgTextField.addSubview(passwordTextField)
        bgTextField.addSubview(line)

        bgTextField.translatesAutoresizingMaskIntoConstraints = false
        bgTextField.layer.cornerRadius = 10
        bgTextField.layer.borderWidth = 0.5
        bgTextField.layer.borderColor = UIColor.lightGray.cgColor
        bgTextField.backgroundColor = .systemGray6

        setupEmailTextField()
        setupPasswordextField()
        setupLine()

        let constraints = [
            bgTextField.heightAnchor.constraint(equalToConstant: 100),
            bgTextField.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 120),
            bgTextField.trailingAnchor.constraint(equalTo: contetnView.trailingAnchor, constant: -16),
            bgTextField.leadingAnchor.constraint(equalTo: contetnView.leadingAnchor, constant: 16),
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func setupEmailTextField(){
        emailTextField.translatesAutoresizingMaskIntoConstraints = false

        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email or phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailTextField.textColor = .black
        emailTextField.autocapitalizationType = .none
        emailTextField.leftViewMode = .always
        emailTextField.tintColor = accentColor

        let constraints = [
            emailTextField.topAnchor.constraint(equalTo: bgTextField.topAnchor),
            emailTextField.bottomAnchor.constraint(equalTo: line.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: bgTextField.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: bgTextField.trailingAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    private func setupPasswordextField(){
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.tintColor = accentColor
        passwordTextField.leftViewMode = .always
        passwordTextField.isSecureTextEntry = true


        let constraints = [
            passwordTextField.topAnchor.constraint(equalTo: line.bottomAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: bgTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: bgTextField.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: bgTextField.trailingAnchor)

        ]

        NSLayoutConstraint.activate(constraints)
    }




    private func setupLine() {
        line.translatesAutoresizingMaskIntoConstraints = false

        line.backgroundColor = .lightGray

        let constraints = [
            line.centerYAnchor.constraint(equalTo: bgTextField.centerYAnchor),
            line.centerXAnchor.constraint(equalTo: bgTextField.centerXAnchor),
            line.heightAnchor.constraint(equalToConstant: 0.5),
            line.widthAnchor.constraint(equalTo: bgTextField.widthAnchor)
        ]

        NSLayoutConstraint.activate(constraints)

    }
    
    // MARK: - Button
    
    func setupButtonLogin(){
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        contetnView.addSubview(buttonLogin)
        
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        buttonLogin.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        buttonLogin.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        buttonLogin.layer.masksToBounds = true
        buttonLogin.layer.cornerRadius = 10
        
        buttonLogin.addTarget(self, action: #selector(pressLogin), for: .touchUpInside)
        
        let constraints = [
            buttonLogin.topAnchor.constraint(equalTo: bgTextField.bottomAnchor, constant: 16),
            buttonLogin.leadingAnchor.constraint(equalTo: contetnView.leadingAnchor, constant: 16),
            buttonLogin.trailingAnchor.constraint(equalTo: contetnView.trailingAnchor, constant: -16),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),
            buttonLogin.bottomAnchor.constraint(equalTo: contetnView.bottomAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    @objc private func pressLogin(){
        performSegue(withIdentifier: "profile", sender: self)

    }
    
    /// Keyboard observers
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: Keyboard actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

extension UIImage {
    func alpha(_ value: CGFloat) ->  UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
