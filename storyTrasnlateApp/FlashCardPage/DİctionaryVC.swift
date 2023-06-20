//
//  DİctionaryViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 8.04.2023.
//
import UIKit
import CoreData

class FlashCardsVC: UIViewController {
    
    let dictView = DictView()
    
    let viewModel = DictionaryViewModel()
    var currentWordIndex = 0
    var isTurkish = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configure()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned(_:)))
        dictView.addGestureRecognizer(panGesture)
        dictView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
         dictView.addGestureRecognizer(tapGesture)
         dictView.isUserInteractionEnabled = true
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "FlashCards"
        
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
            if let firstWord = self.viewModel.dictionary.first?.value(forKey: "englishWord") as? String {
                DispatchQueue.main.async {
                    self.dictView.updateWord(with: firstWord)
                }
            }
        }
    }
    
    @objc func panned(_ gesture: UIPanGestureRecognizer) {

        switch gesture.state {
        case .changed:
            
            let translation = gesture.translation(in: dictView)
            let degrees : CGFloat = translation.x / 20
            let angle : CGFloat = (degrees * .pi) / 180
            let rotationalTransform = CGAffineTransform(rotationAngle: angle)
            dictView.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
        case .ended:
            let translation = gesture.translation(in: dictView)
            let threshold : CGFloat = 100

            var newIndex = currentWordIndex
            if translation.x > threshold {
                newIndex = (currentWordIndex - 1 + viewModel.dictionary.count) % viewModel.dictionary.count
            } else if translation.x < threshold{
                newIndex = (currentWordIndex + 1) % viewModel.dictionary.count
            }
            
            if newIndex != currentWordIndex {
                // Yeni kartı arka planda hazırla
                if let newWord = self.viewModel.dictionary[newIndex].value(forKey: "englishWord") as? String {
                    self.dictView.updateWord(with: newWord)
                }
                
                // Yeni kartı ekranda göster, animasyon tamamlanmadan önce
                let translation = CGPoint(x: translation.x > 0 ? 1000 : -1000, y: translation.y)
                let degrees : CGFloat = translation.x / 20
                let angle : CGFloat = (degrees * .pi) / 180
                let rotationalTransform = CGAffineTransform(rotationAngle: angle)
                self.dictView.transform = rotationalTransform.translatedBy(x: translation.x, y: translation.y)
                
                // Eski kartı ekrandan çıkart
                UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1) {
                    self.dictView.transform = .identity
                } completion: { _ in
                    // Eski kartı tamamen kaldır ve yeni kartı göster
                    self.currentWordIndex = newIndex
                    UIView.animate(withDuration: 1.0) {
                        self.dictView.transform = .identity
                    }
                }
            } else {
                // Ekrandan kaydırmayı gerçekleştirmediğimizde kartı eski konumuna getir
                UIView.animate(withDuration: 0.3) {
                    self.dictView.transform = .identity
                }
            }
        
        default:
            break
        }
    }
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
    
        isTurkish = !isTurkish
        
        // Get the current word
        if let currentWord = self.viewModel.dictionary[self.currentWordIndex].value(forKey: "englishWord") as? String {
            self.dictView.updateWord(with: currentWord)
        }
        
        // Perform a flip animation
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        UIView.transition(with: dictView, duration: 0.5, options: transitionOptions, animations: {
            // Set the card to show the current language
            if self.isTurkish {
               if let turkishWord = self.viewModel.dictionary[self.currentWordIndex].value(forKey: "turkishWord") as? String {
                    self.dictView.updateWord(with: turkishWord)
                }

                
            } else {
                if let currentWord = self.viewModel.dictionary[self.currentWordIndex].value(forKey: "englishWord") as? String {
                    self.dictView.updateWord(with: currentWord)
                }
            }
        })
    }
}
