//
//  WelcomeAssembly.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class WelcomeAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = WelcomeViewController()
        let presenter = WelcomePresenter()
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
