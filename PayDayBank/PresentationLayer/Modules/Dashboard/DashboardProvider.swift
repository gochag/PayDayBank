//
//  DashBoar.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 14.03.2022.
//

import UIKit

protocol DashboardProvider {
    var transactions: [Transaction] { get set }
    func buildDataSourceForDashboar(completion: @escaping (([DashboardType]) -> Void))
}

final class DashboardProviderImp: DashboardProvider {
    
    var transactions = [Transaction]()
    var month = [Date]()
    
    func buildDataSourceForDashboar(completion: @escaping (([DashboardType]) -> Void)) {
        
        guard let transaction = self.transactions.sorted(by: {$0.date > $1.date}).first else {
            completion([])
            return
        }
        
        let startDayOfMonth = transaction.date.startOfMonth()
        let endDayOfMonth = transaction.date.endOfMonth()
        
        print("startDayOfMonth: ", startDayOfMonth)
        print("current: ", transaction.date)
        print("endDayOfMonth: ", endDayOfMonth)
        
        let transactionList = self.transactions.filter{$0.date.isBetween(startDayOfMonth, and: endDayOfMonth)}
        
        ///
        let totalIncome: CGFloat = transactionList.filter{ $0.amount > 0 }.reduce(0) { $0 + $1.amount }
        let totalExpenses: CGFloat = transactionList.filter{ $0.amount < 0 }.reduce(0) { $0 - $1.amount }
        
        let summ = totalIncome + totalExpenses
        var circlePercent = [CGFloat]()
        
        transactionList.forEach { transaction in
            let percent = abs(transaction.amount) * 100 / summ
            circlePercent.append(percent / 100)
        }
        
        let model = DashboarDiagramModel(income: "+ \(totalIncome)", expenses: "- \(totalExpenses)", percents: circlePercent)
        
        var result = [DashboardType.diagram(model)]
        result += transactionList.map { DashboardType.category($0) }
        
        completion(result)
    }
}
