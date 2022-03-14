//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 14.03.2022.
//

import UIKit

struct DashboarDiagramModel {
    var income: String
    var expenses: String
    var percents: [CGFloat]
}


final class DashboarDiagramCell: UITableViewCell {
    
    private lazy var circleView: CircleView = {
        let circleView = CircleView()
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var incomeLabel: UILabel = {
        let label = UILabel()
        label.text = "+4424"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var expensesLabel: UILabel = {
        let label = UILabel()
        label.text = "-2600"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.drawSelf()
    }
    
    //MARK: Public func
    
    func setupView(with model: DashboarDiagramModel) {
        self.circleView.percentList = model.percents
        self.incomeLabel.text = model.income
        self.expensesLabel.text = model.expenses
        self.circleView.setNeedsDisplay()
    }
    
    //MARK: DrawSelf
    
    private func drawSelf() {
        self.contentView.addSubview(self.circleView)
        self.contentView.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(self.incomeLabel)
        self.stackView.addArrangedSubview(self.expensesLabel)
        
        var constraint = self.createConstraintForTableView()
        constraint += self.createConstraintForStackView()
        NSLayoutConstraint.activate(constraint)
    }
    
    private func createConstraintForTableView() -> [NSLayoutConstraint] {
        return [
            self.circleView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 32),
            self.circleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 32),
            self.circleView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -32),
            self.circleView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -32)
        ]
    }
    
    private func createConstraintForStackView() -> [NSLayoutConstraint] {
        return [
            self.stackView.centerXAnchor.constraint(equalTo: self.circleView.centerXAnchor),
            self.stackView.centerYAnchor.constraint(equalTo: self.circleView.centerYAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 32),
            self.stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -32),
        ]
    }
}
