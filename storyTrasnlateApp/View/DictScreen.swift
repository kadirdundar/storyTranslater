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
        
        backgroundColor = .systemRed
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
    
  /*  func updateWord(with newWord: String) {   kartın arka yüzünü göstermek için
        let newWordLabel = UILabel()
        newWordLabel.translatesAutoresizingMaskIntoConstraints = false
        newWordLabel.text = newWord

        addSubview(newWordLabel)
        NSLayoutConstraint.activate([
            newWordLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            newWordLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        UIView.transition(from: word, to: newWordLabel, duration: 0.3, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: { [weak self] _ in
            self?.word.removeFromSuperview()
            self?.word = newWordLabel
        })
    }*/
    
    /*    func updateWord(with newWord: String) {
     let newWordLabel = UILabel()
     newWordLabel.translatesAutoresizingMaskIntoConstraints = false
     newWordLabel.text = newWord
     
     let xPosition = self.frame.width
     let yPosition = self.frame.height / 2.0
     let animationDuration = 0.5
     
     newWordLabel.frame = CGRect(x: xPosition, y: yPosition, width: 0, height: 0)
     addSubview(newWordLabel)
     
     UIView.animate(withDuration: animationDuration) { [weak self] in
         newWordLabel.frame = CGRect(x: 0, y: yPosition, width: self?.frame.width ?? 0, height: self?.frame.height ?? 0)
         self?.frame = CGRect(x: -xPosition, y: self?.frame.origin.y ?? 0, width: self?.frame.width ?? 0, height: self?.frame.height ?? 0)
     } completion: { [weak self] _ in
         self?.word.removeFromSuperview()
         self?.word = newWordLabel
         self?.frame = CGRect(x: 0, y: self?.frame.origin.y ?? 0, width: self?.frame.width ?? 0, height: self?.frame.height ?? 0)
     }
 }*/
}

