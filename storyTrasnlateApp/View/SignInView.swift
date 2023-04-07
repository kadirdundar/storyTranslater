//
//  SignInView.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 4.04.2023.
//

import UIKit
class SingUpView: UIView {
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
        tf.translatesAutoresizingMaskIntoConstraints = false

        return tf
    }()

    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let confirmPasswordTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Şifreyi Onayla"
            tf.isSecureTextEntry = true
            tf.backgroundColor = .white
            tf.borderStyle = .roundedRect
            tf.font = UIFont.systemFont(ofSize: 14)
            tf.translatesAutoresizingMaskIntoConstraints = false
            return tf
        }()

    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Kaydol", for: .normal)
        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       
        return button
    }()


    
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        addSubview(appName)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
    
        addSubview(submitButton)
       
       

       

        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 150),
            emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            emailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            confirmPasswordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            confirmPasswordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50),

            submitButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 16),
            submitButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32),
            submitButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            
            appName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            appName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
       
      
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Actions

    @objc private func handleTextInputChange() {
        let isFormValid = emailTextField.text?.isEmpty == false && passwordTextField.text?.isEmpty == false
        submitButton.isEnabled = isFormValid
         submitButton.backgroundColor = isFormValid ? UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1) : UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
    }

   

    @objc private func handleShowSignUp() {
  
    }
 
    @objc private func handleSignUp() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }

        // TODO: Perform sign-up action with email and password
    }

    
}
