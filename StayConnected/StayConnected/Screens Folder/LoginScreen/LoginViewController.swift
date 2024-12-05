//
//  LoginViewController.swift
//  StayConnected
//
//  Created by Levan Gorjeladze on 30.11.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let viewModel = LoginViewModel()

    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont(name: "Inter", size: 12)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: "Inter", size: 16)
        return textField
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Inter", size: 12)
        return label
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.font = UIFont(name: "Inter", size: 16)
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = UIColor(hex: "#4E53A2")
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(UIColor(hex: "#5E6366"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(loginLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
        
        setupConstraints()
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc func signUpButtonTapped() {
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @objc func loginButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        if let _ = KeychainService.getAccessToken() {
            let homeViewController = HomeViewController()
            navigationController?.pushViewController(homeViewController, animated: true)
        } else {
            viewModel.login(email: email, password: password) { [weak self] success in
                if success {
                    let homeViewController = HomeViewController()
                    self?.navigationController?.pushViewController(homeViewController, animated: true)
                } else {
                    let alert = UIAlertController(title: "Error", message: "Login failed", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alert, animated: true)
                }
            }
        }
    }

    
    func setupConstraints() {
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 141),
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 187),
            loginLabel.widthAnchor.constraint(equalToConstant: 111),
            loginLabel.heightAnchor.constraint(equalToConstant: 30),
            
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 30),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailTextField.widthAnchor.constraint(equalToConstant: 327),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.widthAnchor.constraint(equalToConstant: 327),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25.01),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 342.7),
            loginButton.heightAnchor.constraint(equalToConstant: 59),
            
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            signUpButton.widthAnchor.constraint(equalToConstant: 60),
            signUpButton.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}


extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexSanitized.hasPrefix("#") {
            hexSanitized = String(hexSanitized.dropFirst())
        }
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
