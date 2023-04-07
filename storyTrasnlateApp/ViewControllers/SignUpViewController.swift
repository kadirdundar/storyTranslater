//
//  SignUpViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 4.04.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    let signUpView = SingUpView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
     
    }
   
    func setupUI()  {
        view.addSubview(signUpView)
        
        signUpView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.topAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }



}
