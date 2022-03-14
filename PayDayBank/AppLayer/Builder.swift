//
//  Builder.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation
import UIKit

final class Builder {
    
    let networkService: NetworkService
    let transactionService: TransactionService
    
    static let shared = Builder()
    
    private init() {
        self.networkService = NetworkMockData()
        self.transactionService = TransactionServiceImp(networkService: networkService)
    }
    
}
