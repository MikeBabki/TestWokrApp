//
//  RegistrationViewController.swift
//  TestWokrApp
//
//  Created by Макар Тюрморезов on 06.06.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mainImage")
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.55
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Scroll View propertie
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    // MARK: - Registration View properties
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var registrationView: UIView = {
        let registrationView = UIView()
        registrationView.backgroundColor = .clear
        registrationView.translatesAutoresizingMaskIntoConstraints = false
        return registrationView
    }()
    
    private lazy var loginRegisterLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
//        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()

    private lazy var confirmPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Confirm password"
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemGray3
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var passwordValidationView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.borderWidth = 0.7
        view.layer.cornerRadius = 5
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var confirmPasswordValidationView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.7
        view.layer.cornerRadius = 5
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - LifeCycle ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeSetup()
        setupText()
    }
    
    // MARK: - Action (Button)
    
    @objc func buttonTapped(sender : UIButton) {
                    print("Button was pressed")
                }
    @objc func textFieldDidChange(_ textField: UITextField) {
        print(textField.text)

    }
    // MARK: - Private methods
    
    private func initializeSetup() {
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
}

// MARK: - Extention for text validation

extension RegistrationViewController: UITextFieldDelegate {
    
    //    func textFieldDidEndEditing(_ textField: UITextField) {
    //
    //        if textField.text!.count >= 8 && ((textField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits)) != nil)  {
    //            passwordValidationView.isHidden = false
    //            if passwordTextField.text == confirmPasswordTextField.text {
    //                confirmPasswordValidationView.isHidden = false
    //                registerButton.isEnabled = true
    //            }
    //        } else {
    //            passwordValidationView.isHidden = true        }
    //    }
    
    //    func textFieldDidBeginEditing(_ textField: UITextField) {
    //        if textField.text!.count >= 8 && ((textField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits)) != nil)  {
    //            passwordValidationView.isHidden = false
    //        } else {
    //            passwordValidationView.isHidden = true
    //
    //        }
    //    }
    //}
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count >= 8 && ((textField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits)) != nil)  {
            passwordValidationView.isHidden = false
            if passwordTextField.text == confirmPasswordTextField.text {
                confirmPasswordValidationView.isHidden = false
                registerButton.isEnabled = true
            }
        } else {
            passwordValidationView.isHidden = true        }
        return true
    }
    
    
    
    
    //    func textFieldDidEndEditing(_ textField: UITextField) {
    //
    //        if textField.text!.count >= 8 && ((textField.text?.rangeOfCharacter(from: CharacterSet.decimalDigits)) != nil)  {
    //            passwordValidationView.isHidden = false
    //            if passwordTextField.text == confirmPasswordTextField.text {
    ////                confirmPasswordValidationView.isHidden = false
    ////                registerButton.isEnabled = true
    //            }
    //        } else {
    //            passwordValidationView.isHidden = true        }
    //    }
}

// MARK: - Extention - AddSubView's - Constraints

extension RegistrationViewController {
    
        func setupText() {
            view.backgroundColor = .white
            view.addSubview(backgroundImage)
            view.addSubview(scrollView)
            
            scrollView.addSubview(contentView)
            contentView.addSubview(registrationView)
            
            registrationView.addSubview(loginRegisterLabel)
            registrationView.addSubview(loginTextField)
            registrationView.addSubview(passwordLabel)
            registrationView.addSubview(passwordTextField)
            registrationView.addSubview(confirmPasswordLabel)
            registrationView.addSubview(confirmPasswordTextField)
            registrationView.addSubview(registerButton)
            registrationView.addSubview(passwordValidationView)
            registrationView.addSubview(confirmPasswordValidationView)
            
            NSLayoutConstraint.activate([
               
                // MARK: - Constraint (Background image)
                
                backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                
                // MARK: - Constraint (ScrollView, ContentView, RegistrationView)
                
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                
                contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),

                contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1),
                contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1),
                
                registrationView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                registrationView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                registrationView.widthAnchor.constraint(equalToConstant: 250),
                registrationView.heightAnchor.constraint(equalToConstant: 400),

                // MARK: - UIElements constraints
                
                loginRegisterLabel.topAnchor.constraint(equalTo: registrationView.topAnchor, constant: 16),
                loginRegisterLabel.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor),

                loginTextField.topAnchor.constraint(equalTo: loginRegisterLabel.bottomAnchor, constant: 8),
                loginTextField.leadingAnchor.constraint(equalTo: registrationView.leadingAnchor, constant: 8),
                loginTextField.trailingAnchor.constraint(equalTo: registrationView.trailingAnchor, constant: -8),
                loginTextField.heightAnchor.constraint(equalToConstant: 34),
                
                passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 40),
                passwordLabel.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor),
                
                passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
                passwordTextField.leadingAnchor.constraint(equalTo: registrationView.leadingAnchor, constant: 8),
                passwordTextField.trailingAnchor.constraint(equalTo: registrationView.trailingAnchor, constant: -8),
                passwordTextField.heightAnchor.constraint(equalToConstant: 34),
                
                confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
                confirmPasswordLabel.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor),
                
                confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
                confirmPasswordTextField.leadingAnchor.constraint(equalTo: registrationView.leadingAnchor, constant: 8),
                confirmPasswordTextField.trailingAnchor.constraint(equalTo: registrationView.trailingAnchor, constant: -8),
                confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 34),
                
                registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 40),
                registerButton.centerXAnchor.constraint(equalTo: registrationView.centerXAnchor),
                registerButton.widthAnchor.constraint(equalToConstant: 100),
                
                passwordValidationView.leadingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 16),
                passwordValidationView.topAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 0),
                passwordValidationView.widthAnchor.constraint(equalToConstant: 10),
                passwordValidationView.heightAnchor.constraint(equalToConstant: 10),
                
                confirmPasswordValidationView.leadingAnchor.constraint(equalTo: confirmPasswordTextField.trailingAnchor, constant: 16),
                confirmPasswordValidationView.topAnchor.constraint(equalTo: confirmPasswordTextField.centerYAnchor, constant: 0),
                confirmPasswordValidationView.widthAnchor.constraint(equalToConstant: 10),
                confirmPasswordValidationView.heightAnchor.constraint(equalToConstant: 10)
            ])
    }
}
