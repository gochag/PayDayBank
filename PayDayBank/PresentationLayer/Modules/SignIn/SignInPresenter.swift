//
//  SingINPresenter.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

protocol SignInViewOutput: ViewOutput {
    func checkUserData(username: String, password: String)
}


final class SignInPrsenter {
    
    private enum RegEx {
        static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let password = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"

    }
    
    weak var view: SignInViewIntput?
    var delegate: SceneDelegateIntput?
    
}


//MARK: - SignInViewOutput

extension SignInPrsenter: SignInViewOutput {
    
    func checkUserData(username: String, password: String) {
        
        if !username.checkRegEx(with: RegEx.email) {
            print("Wrong email")
            return
        }
        
        if !password.checkRegEx(with: RegEx.password) {
            print("Wrong password")
            return
        }
        
        self.delegate?.setStartScreent(autorithed: true)
    }
}
