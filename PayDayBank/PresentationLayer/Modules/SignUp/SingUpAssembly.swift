//
//  SingOutAssembly.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class SignUpAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = SignUpViewController()
        let presenter = SignUpPrsenter()
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
