//
//  SingINAssembly.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class SignInAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = SignInViewController()
        let presenter = SignInPrsenter()
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
