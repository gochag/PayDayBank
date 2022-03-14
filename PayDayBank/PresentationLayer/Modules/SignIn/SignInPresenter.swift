//
//  SingINPresenter.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

protocol SignInViewOutput: ViewOutput {
    
}


final class SignInPrsenter {
    
    weak var view: SignInViewIntput?
    
}


extension SignInPrsenter: SignInViewOutput {
    
}
