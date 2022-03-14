//
//  WelcomeAssembly.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class DashboardAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let transactionService = Builder.shared.transactionService
        
        let provider = DashboardProviderImp()
        
        let view = DashboardViewController()
        let presenter = DashboardPresenter(service: transactionService, provider: provider)
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
}
