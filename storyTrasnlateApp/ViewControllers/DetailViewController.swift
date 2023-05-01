//
//  DetailViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 9.04.2023.
//
import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        tv.isSelectable = true
        tv.dataDetectorTypes = .all
        tv.text = "Once upon a time, there was a young woman named Lily who lived in a small village nestled in the mountains. Lily was a kind and hardworking person who spent most of her days tending to the farm that her family owned.  One day, while walking through the woods, Lily stumbled upon an old, abandoned cottage. Curious, she decided to venture inside and found a dusty old book lying on the floor. As she began to read the book, she realized that it was a book of magic spells.  Excited by the discovery, Lily decided to try out one of the spells. She recited the incantation and suddenly found herself surrounded by a swirl of bright colors. When the colors cleared, she found herself standing in a beautiful garden, filled with flowers of every color and shape.   Over the next few weeks, Lily spent all of her free time in the magical garden. She picked flowers, explored hidden paths, and even had tea parties with the garden's resident fairies.   However, one day, Lily realized that the magic was beginning to fade. She knew that she couldn't stay in the garden forever and that she had to return to her normal life. With a heavy heart, she said goodbye to her fairy friends and recited the spell to return home.  When she arrived back at the old cottage, Lily found that the book was gone. She searched everywhere but couldn't find it. Disappointed, she returned to her farm and resumed her daily routine.  Years later, when Lily was an old woman, she was walking through the woods once again. As she passed by the old cottage, she heard a faint whisper. Following the sound, she found herself standing in front of a small, hidden doorway. Inside, she found the book of spells, lying on a shelf. Lily smiled as she realized that the magic had never really left her, and that the garden would always be a part of her life, no matter what."
        tv.isEditable = false
        tv.layer.shadowColor = UIColor.black.cgColor
        tv.layer.shadowOffset = CGSize(width: 0, height: 2)
        tv.layer.shadowOpacity = 0.5
        tv.layer.shadowRadius = 2
        tv.font = UIFont.boldSystemFont(ofSize: 25)
        tv.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        
        
        return tv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        setupUI()
        
        
        
    }
    
    fileprivate func setupUI() {
        view.addSubview(textView)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.backgroundColor = .white
        title = "Hikaye İsmi"
        
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

    func textViewDidChangeSelection(_ textView: UITextView) {
        if let selectedRange = textView.selectedTextRange {
            let selectedText = textView.text(in: selectedRange)
            if let word = selectedText?.trimmingCharacters(in: .whitespacesAndNewlines) {
                showAlert(for: word)
            }
        }
    }
    
    func showAlert(for word: String) {
        let alertController = UIAlertController(title: "Kelime", message: word, preferredStyle: .actionSheet)
        
        // Mesaj etiketini seçin ve özelliklerini değiştirin
        let attributedString = NSAttributedString(string: word, attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 35.0),
            NSAttributedString.Key.foregroundColor : UIColor.red
        ])
        alertController.setValue(attributedString, forKey: "attributedMessage")
        
        let okAction = UIAlertAction(title: "Sözlüğüme Kaydet", style: .cancel, handler: { [weak self] _ in
            // Temizleme işlemi
            self?.textView.selectedTextRange = nil
        })
        
        let cancelAction = UIAlertAction(title: "Kaydetme", style: .destructive, handler: { [weak self] _ in
            // Temizleme işlemi
            self?.textView.selectedTextRange = nil
        })
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

