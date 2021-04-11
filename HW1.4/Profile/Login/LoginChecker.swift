//
//  LoginChecker.swift
//  Navigation
//
//  Created by Кирилл Тила on 31.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

struct LoginChecker {
    static let shared = LoginChecker()
    
    private let login = "1"
    private let password = "1"
    
    private init(){}
    
    func loginCheck(log: String) -> Bool {
        if log == login {
            return true
        } else {
            return false
        }
    }
    
    func pasCheck(pas: String) -> Bool {
        if pas == password {
            return true
        } else {
            return false
        }
    }
}

class LoginInspector: LoginViewControllerDelegate {
    
    func loginCheck(log: String) -> Bool {
        guard LoginChecker.shared.loginCheck(log: log) else { return false }
        return true
    }
    
    func pasCheck(pas: String) -> Bool {
        guard LoginChecker.shared.pasCheck(pas: pas) else { return false }
        return true
    }
    
}
