//
//  DİctionaryViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//

import UIKit
import CoreData

class DI_ctionaryViewController: UIViewController {
    
    let dictView = DictView()
    let viewModel = DictionaryViewModel()
    var currentWordIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configure()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        dictView.addGestureRecognizer(panGesture)
        dictView.isUserInteractionEnabled = true
    }
    
    func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Dictionary"
        
        self.view.addSubview(dictView)
        dictView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dictView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            dictView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            dictView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            dictView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }
    
    func configure()  {
        viewModel.fetchData {
            if let firstWord = self.viewModel.dictionary.first?.value(forKey: "turkishWord") as? String {
                DispatchQueue.main.async {
                    self.dictView.updateWord(with: firstWord)
                }
            }
        }
    }
    
    @objc func panned(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: dictView)
        


        switch gesture.state {
        case .changed:
            dictView.transform = CGAffineTransform(translationX: translation.x, y: 0)
        case .ended:
            if translation.x > 0 {
                currentWordIndex = (currentWordIndex - 1 + viewModel.dictionary.count) % viewModel.dictionary.count
            } else {
                currentWordIndex = (currentWordIndex + 1) % viewModel.dictionary.count
            }
            UIView.animate(withDuration: 0.6) {
                self.dictView.transform = .identity
            }
            if let newWord = viewModel.dictionary[currentWordIndex].value(forKey: "turkishWord") as? String {
                dictView.updateWord(with: newWord)
            }
        
        default:
            break
        }
    }
}
