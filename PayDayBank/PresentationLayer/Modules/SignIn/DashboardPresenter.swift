//
//  WelcomPresenter.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation
import UIKit

enum DashboardType {
    case diagram(DashboarDiagramModel)
    case category(Transaction)
}


protocol DashboardViewOutput: ViewOutput {
    func obtainTransactions()
    func nextDate()
    func previousDate()
}

final class DashboardPresenter {
    
    weak var view: DashboardViewIntput?
    
    private let service: TransactionService
    private var provider: DashboardProvider

    // MARK: init
    
    init(service: TransactionService, provider: DashboardProvider) {
        self.service = service
        self.provider = provider
    }
    
    private func updateView() {
        self.provider.buildDataSourceForDashboar { list in
            self.view?.updateTransaction(vieModel: list)
        }
    }
}

extension DashboardPresenter: DashboardViewOutput {
    
    func obtainTransactions() {
        self.service.obtainTransaction {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let transactions):
                self.provider.transactions = transactions
                self.updateView()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func nextDate() {
        
    }
    
    func previousDate() {
        
    }
}
