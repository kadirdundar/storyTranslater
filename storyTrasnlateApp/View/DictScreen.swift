//
//  DictScreen.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 4.05.2023.
//

import UIKit


class DictView: UIView {

    // MARK: - Properties
    
    let word : UILabel = {
       let word = UILabel()
        word.translatesAutoresizingMaskIntoConstraints = false
       
        return word
    }()
   
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(word)
        
        backgroundColor = .systemRed
        layer.cornerRadius = 5



        NSLayoutConstraint.activate([
            word.centerYAnchor.constraint(equalTo: centerYAnchor),
            word.centerXAnchor.constraint(equalTo: centerXAnchor)

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Actions

   
}

