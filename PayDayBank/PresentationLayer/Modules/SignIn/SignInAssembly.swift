//
//  SingINAssembly.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class SignInAssembly: Assembly {
    
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        guard let model = model as? Model else { fatalError() }

        let view = SignInViewController()
        let presenter = SignInPrsenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.delegate = model.delegate
        return view
    }
    
    struct Model: TransitionModel {
        var delegate: SceneDelegateIntput
    }
}
