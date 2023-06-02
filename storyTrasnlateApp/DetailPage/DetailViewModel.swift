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
            let newWord = Word(turkishWord: "türkçe" , id: UUID(),englishWord:word)//türkçe karşılığ APIdan gelecek
            words.append(newWord)
            saveWord(newWord)
        }
    func showAlert(for word: String) -> UIAlertController {
        
        let alert = UIAlertController.alert()
        alert.setTitle("🇬🇧 \(word)", color: .red, size: 30)
        alert.setMessage("🇹🇷 Türkçe",color: .brown, size: 26)
        alert.addAction(
            title: "Sözlüğüme Kaydet",
            systemIcon: "envelope.fill",
            color: .darkGray,
            leftAligment: true
        ) {
            self.addWord(word)
        }
        alert.addAction(
            title: "Kaydetme",
            systemIcon: "trash.fill",
            color: .blue,
            leftAligment: true
        ) {
            self.vieww.textView.selectedTextRange = nil
        }
        return alert
    }


        private func saveWord(_ word: Word) {
            
            self.vieww.textView.selectedTextRange = nil
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let Sword = NSEntityDescription.insertNewObject(forEntityName: "Dictionaryy", into: context)
            Sword.setValue(word.englishWord , forKey: "englishWord")
            Sword.setValue(word.id, forKey: "id")
            Sword.setValue(word.turkishWord, forKey: "turkishWord")
            
            do {
                try context.save()
                print("kayıt edildi")
            } catch  {
                print("hata")
            }
        }
    func attributedString(_ text: String, _ fontSize: CGFloat, _ color: UIColor) -> NSAttributedString {
        let attributedString = NSAttributedString(string: text, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: fontSize), NSAttributedString.Key.foregroundColor: color])
        return attributedString
    }
}
