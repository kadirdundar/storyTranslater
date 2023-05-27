//
//  ViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 3.04.2023.
//

import UIKit
class LoginViewController: UIViewController {

  let viewModel = LoginViewModel()
  let exview = LoginView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
      setupVieww()
      setupbuttons()
    
    }
    
    func setupVieww (){
        self.view.addSubview(exview)
        
        self.exview.backgroundColor = .systemBackground
        exview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            exview.topAnchor.constraint(equalTo: view.topAnchor),
            exview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            exview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
    }
    private func setupbuttons() {
        exview.loginButtonTappedCallback = { [self] in
            self.performTabBarVC()
        }
           exview.submitButtonTapped = { [self] in
               self.performSegueToHedefViewController()
           }
       }
    func performSegueToHedefViewController() {
        let hedefViewController = SignUpViewController() // Hedef view controller'ı oluşturun
        self.navigationController?.pushViewController(hedefViewController, animated: true) // Seque'yi başlatın
    }
    
    func performTabBarVC(){
        let tabBarVC = TabBarViewController()
                tabBarVC.modalPresentationStyle = .fullScreen
                present(tabBarVC, animated: true)
    }
    
  
}

