//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

protocol TransactionInput: AnyObject {
    func updateTransaction(transactions: [Transaction])
    func failureLoadTransaction(error: AppError)
}

final class TransactionViewController: UIViewController {
    
    var presenter: TransactionOutput?
    
    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(cellTypes: [
            TransactionCell.self
        ])
        tableview.backgroundColor = .clear
        return tableview
    }()
    
    private var transactions = [Transaction]()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transaction List"
        self.drawSelf()
        self.presenter?.obtainTransactions()
    }
    
    
    // MARK: drawSelf
    
    private func drawSelf() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate(self.createConstraintForTableView())
    }
    
    private func createConstraintForTableView() -> [NSLayoutConstraint] {
        return [
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
    }
}

extension TransactionViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactions.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TransactionCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setupView(model: self.transactions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

extension TransactionViewController: TransactionInput {
    
    func updateTransaction(transactions: [Transaction]) {
        self.transactions = transactions
    }
    
    func failureLoadTransaction(error: AppError) {
        
    }
}
