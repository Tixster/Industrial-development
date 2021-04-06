//
//  PfofileHeaderView.swift
//  Navigation
//
//  Created by Кирилл Тила on 19.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit


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
        
        contentView.addSubview(bgView)
        bgView.addSubviews(imageProfile, profileStatus, profileName, buttonStatus, textFieldStatus)
        setupImageProfile()
        setupButtonStatus()
        setupProfileStatus()
        setupProfileName()
        setupTextFieldStatus()
        
        bgView.backgroundColor = .white
        
        bgView.snp.makeConstraints({
            $0.height.width.equalToSuperview()
        })

    }
    
    
    private func setupImageProfile(){
     
        imageProfile.snp.makeConstraints({
            $0.top.leading.equalTo(bgView).offset(16)
            $0.size.equalTo(CGSize(width: 80, height: 80))
        })
 
    }
    

    private func setupProfileName(){
     
        profileName.snp.makeConstraints({
            $0.top.equalTo(bgView).offset(27)
            $0.leading.equalTo(imageProfile.snp.trailing).offset(16)
        })
    }
    
    
    private func setupProfileStatus(){
        
        profileStatus.snp.makeConstraints({
            $0.top.equalTo(profileName.snp.bottom).offset(16)
            $0.leading.equalTo(imageProfile.snp.trailing).offset(16)
        })
        
    }
    
    private func setupTextFieldStatus(){
        
        textFieldStatus.snp.makeConstraints({
            $0.top.equalTo(profileName.snp.bottom).offset(49)
            $0.leading.equalTo(imageProfile.snp.trailing).offset(16)
            $0.trailing.equalTo(bgView.snp.trailing).offset(-16)
            $0.height.equalTo(40)
        })
 
    }
    
    private func setupButtonStatus(){
        
        buttonStatus.snp.makeConstraints({
            $0.top.equalTo(textFieldStatus.snp.bottom).offset(16)
            $0.bottom.trailing.equalTo(bgView).offset(-16)
            $0.leading.equalTo(bgView).offset(16)
            $0.height.equalTo(50)
        })
 
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
