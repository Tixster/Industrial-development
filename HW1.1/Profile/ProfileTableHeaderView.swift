//
//  PfofileHeaderView.swift
//  Navigation
//
//  Created by Кирилл Тила on 19.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit



class ProfileTableHeaderView: UITableViewHeaderFooterView {
    
    private var bgView = UIView()
    
   var imageProfile: UIImageView = {
        let imageProfile = UIImageView()
        imageProfile.image = UIImage(named: "hipster cat")
        imageProfile.contentMode = .scaleAspectFill
        imageProfile.clipsToBounds = true
        imageProfile.layer.cornerRadius = 80 / 2
        imageProfile.layer.borderWidth = 3
        imageProfile.layer.borderColor = UIColor.lightGray.cgColor
        imageProfile.isUserInteractionEnabled = true
 
        return imageProfile
    }()
    
    private var profileName: UILabel = {
        let profileName = UILabel()
        profileName.text = "Hipster Cat"
        profileName.textColor = .black
        profileName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return profileName
        
    }()
    
    private var profileStatus: UILabel = {
        let profileStatus = UILabel()
        profileStatus.text = "Waiting for something..."
        profileStatus.textColor = .gray
        profileStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return profileStatus
    }()
    
    private var textFieldStatus: UITextField = {
        let textFieldStatus = UITextField()
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        
        textFieldStatus.attributedPlaceholder = NSAttributedString(string: "Введите новый статус", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        textFieldStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textFieldStatus.textColor = .black
        textFieldStatus.backgroundColor = .white
        
        textFieldStatus.leftView = paddingView
        textFieldStatus.leftViewMode = .always
        
        textFieldStatus.layer.borderWidth = 1
        textFieldStatus.layer.borderColor = UIColor.black.cgColor
        textFieldStatus.layer.cornerRadius = 12
        
        textFieldStatus.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textFieldStatus
        
    }()
    
    private var buttonStatus: UIButton = {
        let buttonStatus = UIButton()
        buttonStatus.backgroundColor = .systemBlue
        buttonStatus.setTitle("Show status", for: .normal)
        buttonStatus.setTitleColor(.white, for: .normal)
        buttonStatus.layer.cornerRadius = 4
        
        buttonStatus.layer.shadowOffset = .init(width: 4, height: 4)
        buttonStatus.layer.shadowRadius = 4
        buttonStatus.layer.shadowColor = UIColor.black.cgColor
        buttonStatus.layer.shadowOpacity = 0.7
        
        buttonStatus.addTarget(self, action: #selector(buttonStatusTapped), for: .touchUpInside)
        return buttonStatus
        
        
    }()
    
    private var statusText: String?
    
    
    private func setupBgView(){
        bgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bgView)
        bgView.addSubviews(imageProfile, profileStatus, profileName, buttonStatus, textFieldStatus)
        setupImageProfile()
        setupButtonStatus()
        setupProfileStatus()
        setupProfileName()
        setupTextFieldStatus()
        
        bgView.backgroundColor = .white
        
        let constraints = [
            bgView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            bgView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
    private func setupImageProfile(){
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
            
        let constraints = [
            imageProfile.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 16),
            imageProfile.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            imageProfile.heightAnchor.constraint(equalToConstant: 80),
            imageProfile.widthAnchor.constraint(equalToConstant: 80)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    

    private func setupProfileName(){
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraints = [
            profileName.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 27),
            profileName.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
    private func setupProfileStatus(){
        profileStatus.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraints = [
            profileStatus.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 16),
            profileStatus.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupTextFieldStatus(){
        textFieldStatus.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            textFieldStatus.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 49),
            textFieldStatus.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 16),
            textFieldStatus.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            textFieldStatus.heightAnchor.constraint(equalToConstant: 40)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupButtonStatus(){
        buttonStatus.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraints = [
            buttonStatus.topAnchor.constraint(equalTo: textFieldStatus.bottomAnchor, constant: 16),
            buttonStatus.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            buttonStatus.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            buttonStatus.heightAnchor.constraint(equalToConstant: 50),
            buttonStatus.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -16)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    

    @objc private func buttonStatusTapped(){
        profileStatus.text = statusText
        textFieldStatus.text = nil
    }
    
    @objc private func statusTextChanged(){
        statusText = textFieldStatus.text
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupBgView()
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
