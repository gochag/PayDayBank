//
//  WelcomPresenter.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

protocol WelcomeViewOutput: ViewOutput {
    
}

final class WelcomePresenter {
    
    weak var view: WelcomeViewIntput?
    
}

extension WelcomePresenter: WelcomeViewOutput {
    
}
