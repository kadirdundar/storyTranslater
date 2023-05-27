//
//  DetailViewModel.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 10.04.2023.
//

import UIKit
import CoreData
class DetailViewModel {
    
    private var words: [Word] = []
     let vieww = DetailView()
        
        func addWord(_ word: String) {
            let newWord = Word(turkishWord: word, id: UUID())
            words.append(newWord)
            saveWord(newWord)
        }
    func showAlert(for word: String) -> UIAlertController {
            let alertController = UIAlertController(title: "Kelime", message: word, preferredStyle: .alert)
            
            
            let attributedString = NSAttributedString(string: word, attributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25.0),
                NSAttributedString.Key.foregroundColor : UIColor.red
            ])
            alertController.setValue(attributedString, forKey: "attributedMessage")
            
            let okAction = UIAlertAction(title: "Sözlüğüme Kaydet", style: .default, handler: { [weak self] _ in
                self?.addWord(word)
            })
            
            let cancelAction = UIAlertAction(title: "Kaydetme", style: .cancel, handler: { [weak self] _ in
                // Temizleme işlemi
                self?.vieww.textView.selectedTextRange = nil
            })
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            return alertController
        }

        private func saveWord(_ word: Word) {
            
            self.vieww.textView.selectedTextRange = nil
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let Sword = NSEntityDescription.insertNewObject(forEntityName: "Dictionaryy", into: context)
            Sword.setValue(word.turkishWord , forKey: "turkishWord")
            Sword.setValue(word.id, forKey: "id")
            
            do {
                try context.save()
                print("kayıt edildi")
            } catch  {
                print("hata")
            }
        }
}
