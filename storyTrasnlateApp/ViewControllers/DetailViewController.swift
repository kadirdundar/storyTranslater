//
//  DetailViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 9.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
    let exview = detailView()

    
    override func viewDidLoad() {
        super.viewDidLoad()

            setupUI()
    }
    
    func setupUI(){
        
        self.view.addSubview(exview)
        self.exview.backgroundColor = .systemBackground

        exview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exview.topAnchor.constraint(equalTo: view.topAnchor),
            exview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            exview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
