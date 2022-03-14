//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import Foundation

struct PayDay: Decodable {
    var transactions: TransactionList
}

struct TransactionList: Decodable {
    var transactions: [Transaction]
}

struct Transaction: Decodable {
    let id: Int
    let accountId: Int
    let amount: Double
    let vendor: String
    let category: String
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountId = "account_id"
        case amount
        case vendor
        case category
        case date
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.accountId = try container.decode(Int.self, forKey: .accountId)
        let amountStr = try container.decode(String.self, forKey: .amount)
        self.amount = Double(amountStr) ?? 0
        self.vendor = try container.decode(String.self, forKey: .vendor)
        self.category = try container.decode(String.self, forKey: .category)
        self.date = try container.decode(Date.self, forKey: .date)
    }
}
