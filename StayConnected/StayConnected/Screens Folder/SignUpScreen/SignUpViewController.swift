//
//  SignUpViewController.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

class SignUpViewController: UIViewController {

    let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.textAlignment = .left
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your full name"
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.alpha = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.alpha = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm Password"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm your password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .none
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 8
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.alpha = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.alpha = 1
        button.backgroundColor = UIColor(hex: "#4E53A2")
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 20, left: 24, bottom: 20, right: 24)
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(signUpLabel)
        view.addSubview(fullNameLabel)
        view.addSubview(fullNameTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(signUpButton)
        
        setupConstraints()

        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            signUpLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            signUpLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 107),
            signUpLabel.widthAnchor.constraint(equalToConstant: 120),
            signUpLabel.heightAnchor.constraint(equalToConstant: 30),

            fullNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            fullNameLabel.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: 50),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 327),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 15),

            fullNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            fullNameTextField.widthAnchor.constraint(equalToConstant: 327),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 52),

            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 30),

            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.widthAnchor.constraint(equalToConstant: 327),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),

            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),

            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 5),
            confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 327),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 52),

            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.01),
            signUpButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 50),
            signUpButton.widthAnchor.constraint(equalToConstant: 342.7),
            signUpButton.heightAnchor.constraint(equalToConstant: 59)
        ])
    }

    @objc func signUpButtonTapped() {
        guard let fullName = fullNameTextField.text, !fullName.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            return
        }

        if password != confirmPassword {
            return
        }

        AuthService().register(username: fullName, password: password) { [weak self] success in
            if success {
                DispatchQueue.main.async {
                    self?.navigateToLogin()
                }
            } else {
                print("error")
            }
        }
    }

    func navigateToLogin() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
