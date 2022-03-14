//
//  WelcomViewController.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

protocol DashboardViewIntput: AnyObject {
    func updateTransaction(vieModel: [DashboardType])
    func failureLoadTransaction(error: AppError)
}

final class DashboardViewController: UIViewController {
    
    var presenter: DashboardViewOutput?
    
    // MARK: Private preporty
    private var vieModel = [DashboardType]()

    private lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(cellTypes: [
            DashboarDiagramCell.self,
            TransactionCell.self
        ])
        tableview.backgroundColor = .clear
        return tableview
    }()
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawSelf()
        self.title = "Dashboard"
        self.presenter?.obtainTransactions()
    }
    
    
    //MARK: DrawSelf
    
    private func drawSelf() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        
        let constraint = self.createConstraintForTableView()
        NSLayoutConstraint.activate(constraint)
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


//MARK: - UITableViewDataSource, UITableViewDelegate

extension DashboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vieModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.vieModel[indexPath.row] {
        case .diagram(let model):
            let cell: DashboarDiagramCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setupView(with: model)
            return cell
        case .category(let model):
            let cell: TransactionCell = tableView.dequeueReusableCell(for: indexPath)
            cell.setupView(model: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.vieModel[indexPath.row] {
        case .diagram:
            return UIScreen.main.bounds.width
        case .category:
            return 64
        }
    }
    
    @objc func nextDate() {
        
    }
    
    @objc func previousDate() {
        
    }
}

//MARK: - WelcomViewIntput

extension DashboardViewController: DashboardViewIntput {
    func updateTransaction(vieModel: [DashboardType]) {
        self.vieModel = vieModel
    }
    
    func failureLoadTransaction(error: AppError) {
        print("error:", error.localizedDescription)
    }
}
