//
//  SettingsViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
    }
    
    func setupUI(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        title = "Settings"
    }

   

}
