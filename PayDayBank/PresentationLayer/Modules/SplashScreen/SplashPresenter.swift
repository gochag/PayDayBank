//
//  SplashPresenter.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

protocol SplashViewOutput: ViewOutput {
    
}

final class SplashPresenter {
    
    weak var view: SplashViewIntput?
    var delegate: SceneDelegateIntput?
    
}


// MARK: - SplashViewOutput

extension SplashPresenter: SplashViewOutput {
    
    func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.delegate?.setStartScreent(autorithed: true)
        }
    }
}
