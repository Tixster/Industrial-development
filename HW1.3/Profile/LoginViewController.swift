//
//  LoginViewController.swift
//  Navigation
//
//  Created by Кирилл Тила on 02.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

protocol LoginViewControllerDelegate: class {
    func loginCheck(log: String) -> Bool
    func pasCheck(pas: String) -> Bool
}

@available(iOS 13.0, *)
class LoginViewController: UIViewController {
    
    private var delegate: LoginViewControllerDelegate?
    
    private var accentColor = UIColor(named: "ColorSet")
    private var imageLogo = UIImageView(image: #imageLiteral(resourceName: "logo"))
    private var stackView = UIStackView()
     var emailTextField = UITextField()
     var passwordTextField = UITextField()
    private var bgTextField = UIView()
    private var line = UIView()
    private var contetnView = UIView()
    private var scrollView = UIScrollView()
    private var buttonLogin = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupScrollView()
        delegate = LoginInspector()
    }
    
    // MARK: - ScrollView
    
    func setupScrollView(){

        view.addSubview(scrollView)
        setupContentView()

        scrollView.snp.makeConstraints({
            $0.bottom.top.leading.trailing.equalToSuperview()
        })

    }
    
    //MARK: - Content
    
    private func setupContentView(){

        scrollView.addSubview(contetnView)

        setupImageLogo()
        setupBgTextField()
        setupButtonLogin()
        
        contetnView.backgroundColor = .white
        
        contetnView.snp.makeConstraints({
            $0.top.bottom.width.equalTo(scrollView)
        })
        
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

        bgTextField.layer.cornerRadius = 10
        bgTextField.layer.borderWidth = 0.5
        bgTextField.layer.borderColor = UIColor.lightGray.cgColor
        bgTextField.backgroundColor = .systemGray6

        setupEmailTextField()
        setupPasswordextField()
        setupLine()

        bgTextField.snp.makeConstraints({
            $0.height.equalTo(100)
            $0.top.equalTo(imageLogo.snp.bottom).offset(120)
            $0.trailing.equalTo(contetnView.snp.trailing).offset(-16)
            $0.leading.equalTo(contetnView.snp.leading).offset(16)
        })

    }

    private func setupEmailTextField(){

        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email or phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        emailTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailTextField.textColor = .black
        emailTextField.autocapitalizationType = .none
        emailTextField.leftViewMode = .always
        emailTextField.tintColor = accentColor

        emailTextField.snp.makeConstraints({
            $0.top.trailing.equalTo(bgTextField)
            $0.bottom.equalTo(line.snp.top)
            $0.leading.equalTo(bgTextField.snp.leading).offset(10)
        })
        
    }

    private func setupPasswordextField(){

        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.autocapitalizationType = .none
        passwordTextField.tintColor = accentColor
        passwordTextField.leftViewMode = .always
        passwordTextField.isSecureTextEntry = true

        passwordTextField.snp.makeConstraints({
            $0.bottom.trailing.equalTo(bgTextField)
            $0.top.equalTo(line.snp.bottom)
            $0.leading.equalTo(bgTextField.snp.leading).offset(10)
        })
        
    }

    private func setupLine() {

        line.backgroundColor = .lightGray

        line.snp.makeConstraints({
            $0.centerX.centerY.width.equalTo(bgTextField)
            $0.height.equalTo(0.5)
        })

    }
    
    // MARK: - Button
    
    func setupButtonLogin(){
        
        contetnView.addSubview(buttonLogin)
        
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.setTitleColor(.white, for: .normal)
        buttonLogin.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        buttonLogin.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .selected)
        buttonLogin.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel").alpha(0.8), for: .highlighted)
        buttonLogin.layer.masksToBounds = true
        buttonLogin.layer.cornerRadius = 10
        
        buttonLogin.addTarget(self, action: #selector(pressLogin), for: .touchUpInside)
        
        buttonLogin.snp.makeConstraints({
            $0.top.equalTo(bgTextField.snp.bottom).offset(16)
            $0.leading.equalTo(contetnView).offset(16)
            $0.trailing.bottom.equalTo(contetnView).offset(-16)
            $0.height.equalTo(50)
        })
        
    }
    
    @objc private func pressLogin(){

        guard let inspetcor = delegate else { return }
        guard let loginText = emailTextField.text, let passwordText = passwordTextField.text else { return print("Неверный логин")  }
        
        let login = inspetcor.loginCheck(log: loginText)
        let password = inspetcor.pasCheck(pas: passwordText)
    
        if login == true && password == true{
            let vc = ProfileViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else if login == false  {
            print("Неверный логин")
        } else if login == true && password == false {
            print("Неверный пароль")
        }

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


