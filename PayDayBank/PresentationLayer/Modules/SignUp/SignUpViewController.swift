//
//  SignOutViewController.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

protocol SignUpViewIntput: AnyObject {
    
}


class SignUpViewController: UIViewController {
    
    private enum Texts {
        static let registration = "Registration"
        static let email = "Email"
        static let firstName = "First Name"
        static let lastName = "Last Name"
        static let phone = "Phone number"
        static let password = "Password"
        static let confirmPass = "Confirm password"
    }
    
    var presenter: SignUpViewOutput?
    
    // MARK: Private preporty
    
    private lazy var fieldStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Texts.registration
        label.font = .boldSystemFont(ofSize: 42)
        return label
    }()
    
    private lazy var fistNameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Texts.firstName
        return textField
    }()
    
    private lazy var lastNameField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Texts.lastName
        return textField
    }()
    
    private lazy var phoneField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Texts.phone
        return textField
    }()
    
    private lazy var emailField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Texts.email
        return textField
    }()
    
    private lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Texts.password
        return textField
    }()
    
    private lazy var confirmPassField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Texts.confirmPass
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawSelf()
    }
    
    
    // MARK: drawSelf
    
    private func drawSelf() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.fieldStack)
        
        self.fieldStack.addArrangedSubview(self.registrationLabel)
        self.fieldStack.addArrangedSubview(self.fistNameField)
        self.fieldStack.addArrangedSubview(self.lastNameField)
        self.fieldStack.addArrangedSubview(self.phoneField)
        self.fieldStack.addArrangedSubview(self.emailField)
        self.fieldStack.addArrangedSubview(self.passwordField)
        self.fieldStack.addArrangedSubview(self.confirmPassField)
        
        let constraint = self.createConstraintForFieldStack()
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func createConstraintForFieldStack() -> [NSLayoutConstraint] {
        return [
            self.fieldStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.fieldStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.fieldStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ]
    }
}

extension SignUpViewController: SignUpViewIntput {
    
}
