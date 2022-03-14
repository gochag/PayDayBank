//
//  SingOutAssembly.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class SingOutAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let view = SignOutViewController()
        let presenter = SignOutPrsenter()
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
