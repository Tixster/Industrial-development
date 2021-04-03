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
    
    let login = "1"
    let pas = "1"
    
    private init(){}
    
}

class LoginInspector: LoginViewControllerDelegate {
    
    func loginCheck(log: String) -> Bool {
        guard log == LoginChecker.shared.login else { return false}
        return true
    }
    
    func pasCheck(pas: String) -> Bool {
        guard pas == LoginChecker.shared.pas else { return false}
        return true
    }
    
}
