//
//  Mo.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

protocol TransactionService {
    func obtainTransaction(completion: @escaping NetworkServiceCompletion<[Transaction]>)
}


final class TransactionServiceImp: TransactionService {
    
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func obtainTransaction(completion: @escaping NetworkServiceCompletion<[Transaction]>) {
        self.networkService.request { result in
            switch result {
            case .success(let data):
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.ISO8601)

                    let transaction = try decoder.decode(PayDay.self, from: data)
                    completion(.success(transaction.transactions.transactions))
                } catch {
                    completion(.failure(.parsing("Couldn't parse file as \(PayDay.self):\n\(error)")))
                }
                
                
                break
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
