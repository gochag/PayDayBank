//
//  Trnsaction.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class TransactionAssembly: Assembly {
    
    static func assembleModule() -> UIViewController {
        
        let transactionService = Builder.shared.transactionService
        let view = TransactionViewController()
        let presenter = TransactionPresenter(service: transactionService)
        
        presenter.view = view
        view.presenter = presenter
        
        return view
    }
}
