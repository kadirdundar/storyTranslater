//
//  DictScreen.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 4.05.2023.
//

import UIKit

class DictView: UIView {

    // MARK: - Properties
    
    var word : UILabel = {
       let word = UILabel()
        word.translatesAutoresizingMaskIntoConstraints = false
        word.font = UIFont.boldSystemFont(ofSize: 30)
        word.textColor = .white
       
        return word
    }()
   
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(word)
        
        backgroundColor = .color4
        layer.cornerRadius = 10

        NSLayoutConstraint.activate([
            word.centerYAnchor.constraint(equalTo: centerYAnchor),
            word.centerXAnchor.constraint(equalTo: centerXAnchor)

        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Actions
    
    
    func updateWord(with newWord: String) {
        word.text = newWord
    }
}

