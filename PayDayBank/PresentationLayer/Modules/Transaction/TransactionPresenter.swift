//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

enum TransactionSort {
    case dateMin
    case dateMax
    case amounMin
    case amountMax
}

protocol TransactionOutput: ViewOutput {
    func obtainTransactions()
    func sortTranscations(with sort: TransactionSort)
}

final class TransactionPresenter {
    
    private let service: TransactionService
    
    
    weak var view: TransactionInput?
    private var transactions = [Transaction]()
    
    
    
    // MARK: init
    
    init(service: TransactionService) {
        self.service = service
    }
}

extension TransactionPresenter: TransactionOutput {
    func obtainTransactions() {
        self.service.obtainTransaction { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let transactionList):
                self.transactions = transactionList.sorted{$0.date > $1.date}
                self.view?.updateTransaction(transactions: self.transactions)
            case .failure(let error):
                self.view?.failureLoadTransaction(error: error)
            }
        }
    }
    
    func sortTranscations(with sort: TransactionSort) {
        switch sort {
        case .dateMin:
            self.transactions =  self.transactions.sorted{$0.date < $1.date}
        case .dateMax:
            self.transactions = self.transactions.sorted{$0.date > $1.date}
        case .amounMin:
            self.transactions =  self.transactions.sorted{$0.amount < $1.amount}
        case .amountMax:
            self.transactions =  self.transactions.sorted{$0.amount > $1.amount}
        }
        
        self.view?.updateTransaction(transactions: self.transactions)
    }
}
