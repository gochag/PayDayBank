//
//  SignInViewController.swift
//  PayDayBank
//
//  Created by Tarlan Hekimzade on 13.03.2022.
//

import UIKit

protocol SignInViewIntput: AnyObject {
    
}

final class SignInViewController: UIViewController {
    
    private enum Texts {
        static let login = "Login"
        static let signIn = "Sign In"
        static let signUp = "Sign Up"
        static let username = "Username"
        static let password = "Password"
    }
    
    var presenter: SignInViewOutput?
    
    
    // MARK: Private preporty
    
    private lazy var fieldStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Texts.login
        label.font = .boldSystemFont(ofSize: 42)
        label.textColor = .black
        return label
    }()
    
    private lazy var emailField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Texts.username
        textField.textColor = .black
        return textField
    }()
    
    private lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Texts.password
        textField.textColor = .black
        return textField
    }()
    
    private lazy var forgotPassButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    ///Buttons
    private lazy var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Texts.signIn, for: .normal)
        button.backgroundColor = Colors.buttonColor
        button.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Texts.signUp, for: .normal)
        button.backgroundColor = Colors.buttonColor
        button.addTarget(self, action: #selector(self.openRegistration), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawSelf()
    }
    
    
    // MARK: drawSelf
    
    private func drawSelf() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.buttonStack)
        self.view.addSubview(self.fieldStack)
        
        self.fieldStack.addArrangedSubview(self.loginLabel)
        self.fieldStack.addArrangedSubview(self.emailField)
        self.fieldStack.addArrangedSubview(self.passwordField)
        
        self.buttonStack.addArrangedSubview(self.signInButton)
        self.buttonStack.addArrangedSubview(self.signUpButton)
        
        var constraint = self.createConstraintForFieldStack()
        constraint += self.createConstraintForButtonStack()
        
        NSLayoutConstraint.activate(constraint)
        
    }
    
    private func createConstraintForFieldStack() -> [NSLayoutConstraint] {
        return [
            self.fieldStack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            self.fieldStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.fieldStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        ]
    }
    
    private func createConstraintForButtonStack() -> [NSLayoutConstraint] {
        return [
            self.buttonStack.topAnchor.constraint(equalTo: self.fieldStack.bottomAnchor, constant: 16),
            self.buttonStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.buttonStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ]
    }
    
    @objc private func openRegistration() {
        let controller = SignUpAssembly.assembleModule()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @objc private func login() {
        let username = self.emailField.text ?? ""
        let password = self.passwordField.text ?? ""
        
        self.presenter?.checkUserData(username: username, password: password)
    }
}

extension SignInViewController: SignInViewIntput {
    
}
