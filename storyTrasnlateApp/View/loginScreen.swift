//
//  loginScreen.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 3.04.2023.
//

import UIKit

class LoginView: UIView {

    // MARK: - Properties
    let appName :UILabel = {
        let lbl = UILabel()
        lbl.text = "Story Translate"
        lbl.font = .boldSystemFont(ofSize: 30)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()

    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()

    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
 

    let signUpLabel: UILabel = {
            let lbl = UILabel()
            lbl.text = "Hala hesabınız yoksa"
            lbl.font = UIFont.systemFont(ofSize: 14)
            lbl.textColor = .gray
            lbl.translatesAutoresizingMaskIntoConstraints = false
            return lbl
        }()
        
    let signUpButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Kaydol", for: .normal)
            button.setTitleColor(UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1), for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            return button
        }()
    
    let googleButton : UIButton = {
        let button = UIButton(type: .custom)
        let googleImage = UIImage(named: "sign-in-with-google-icon-3.jpg")
        button.setImage(googleImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.contentMode = .scaleAspectFit
        
        //button.backgroundColor = .systemBlue
        return button
    }()


    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(appName)
        addSubview(signUpLabel)
        addSubview(signUpButton)
        addSubview(googleButton)
       

        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: appName.topAnchor, constant: 150),
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            emailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 24),
            loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            appName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            appName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            signUpLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12),
            signUpLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -40),
                        
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8),
            signUpButton.leftAnchor.constraint(equalTo: signUpLabel.rightAnchor, constant: 4),
            
            googleButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor,constant: 16),
            googleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            googleButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            googleButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),

          
        
      
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Actions

    @objc private func handleTextInputChange() {
        let isFormValid = emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
        loginButton.isEnabled = isFormValid
        loginButton.backgroundColor = isFormValid ? UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1) : UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
    }
    var loginButtonTappedCallback: (() -> Void)?

    @objc private func handleLogin() {
      loginButtonTappedCallback?()
    }

    @objc private func handleShowSignUp() {
        
    }
    @objc func signUpButtonTapped() {
       
    }
    var submitButtonTapped: (() -> Void)?

       @objc private func loginButtonTapped() {
           submitButtonTapped?()
       }

    @objc private func handleSignUp() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
    }
}
