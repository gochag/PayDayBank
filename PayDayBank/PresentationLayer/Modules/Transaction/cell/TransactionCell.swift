//
//  File.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

final class TransactionCell: UITableViewCell {
    
    private lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.buttonColor
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var circleLabel: UILabel = {
        let label = UILabel()
        label.text = "T"
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "subtitle"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
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
    
    
    func setupView(model: Transaction) {
        self.titleLabel.text = model.vendor
        self.subtitleLabel.text = model.category
        self.circleLabel.text = model.vendor.firstLetter()
        self.amountLabel.text = String(model.amount)
        self.dateLabel.text = DateFormatter.getFormattedDate(date: model.date)
        self.amountLabel.textColor = model.amount < 0 ? .red : Colors.buttonColor
    }
    
    // MARK: drawSelf
    
    private func drawSelf() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.circleView)
        self.contentView.addSubview(self.firstStackView)
        self.contentView.addSubview(self.secondStackView)
        
        self.circleView.addSubview(self.circleLabel)
        
        self.firstStackView.addArrangedSubview(self.titleLabel)
        self.firstStackView.addArrangedSubview(self.amountLabel)
        
        self.secondStackView.addArrangedSubview(self.subtitleLabel)
        self.secondStackView.addArrangedSubview(self.dateLabel)
        
        var constraint = self.createConstraintForCircleView()
        constraint += self.createConstraintForFirstStackView()
        constraint += self.createConstraintForSecondStackView()
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func createConstraintForCircleView() -> [NSLayoutConstraint] {
        return [
            self.circleView.heightAnchor.constraint(equalToConstant: 50),
            self.circleView.widthAnchor.constraint(equalToConstant: 50),
            self.circleView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.circleView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            
            self.circleLabel.centerXAnchor.constraint(equalTo: self.circleView.centerXAnchor),
            self.circleLabel.centerYAnchor.constraint(equalTo: self.circleView.centerYAnchor)
        ]
    }
    
    private func createConstraintForFirstStackView() -> [NSLayoutConstraint] {
        return [
            self.firstStackView.leadingAnchor.constraint(equalTo: self.circleView.trailingAnchor, constant: 8),
            self.firstStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4),
            self.firstStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ]
    }
    
    private func createConstraintForSecondStackView() -> [NSLayoutConstraint] {
        return [
            self.secondStackView.leadingAnchor.constraint(equalTo: self.circleView.trailingAnchor, constant: 8),
            self.secondStackView.topAnchor.constraint(equalTo: self.firstStackView.bottomAnchor, constant: -8),
            self.secondStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.secondStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        ]
    }
}
