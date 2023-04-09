//
//  DİctionaryViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit

class DI_ctionaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    func setupUI(){
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Dictionary"
        
    }
  

}
