//
//  DetailViewController.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 9.04.2023.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    private let viewModel = TextViewModel()
    
    private let turkishTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false

        return textView
    }()
    
    private let englishTextView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        turkishTextView.delegate = self
        englishTextView.delegate = self
        
        view.addSubview(turkishTextView)
        view.addSubview(englishTextView)
        
        NSLayoutConstraint.activate([
            englishTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            englishTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            englishTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            englishTextView.heightAnchor.constraint(equalToConstant: 400),

            turkishTextView.heightAnchor.constraint(equalToConstant: 400),
            turkishTextView.topAnchor.constraint(equalTo: englishTextView.bottomAnchor, constant: 20),
            turkishTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            turkishTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            turkishTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
      
        
        turkishTextView.text = viewModel.turkishText
        englishTextView.text = viewModel.englishText
        
        let turkishTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTurkishTap(_:)))
        turkishTextView.addGestureRecognizer(turkishTapGesture)
        
        let englishTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleEnglishTap(_:)))
        englishTextView.addGestureRecognizer(englishTapGesture)
    }
    
    @objc private func handleTurkishTap(_ sender: UITapGestureRecognizer) {
        let textView = sender.view as! UITextView
        let layoutManager = textView.layoutManager
        var location = sender.location(in: textView)
        location.x -= textView.textContainerInset.left
        location.y -= textView.textContainerInset.top
        let charIndex = layoutManager.characterIndex(for: location, in: textView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        let wordRange = viewModel.turkishRange(for: charIndex)
        turkishTextView.attributedText = viewModel.highlightedTurkishText(at: wordRange)
        englishTextView.attributedText = viewModel.highlightedEnglishText(at: wordRange)
    }
    
    @objc private func handleEnglishTap(_ sender: UITapGestureRecognizer) {
        let textView = sender.view as! UITextView
        let layoutManager = textView.layoutManager
        var location = sender.location(in: textView)
        location.x -= textView.textContainerInset.left
        location.y -= textView.textContainerInset.top
        let charIndex = layoutManager.characterIndex(for: location, in: textView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        let wordRange = viewModel.englishRange(for: charIndex)
        turkishTextView.attributedText = viewModel.highlightedTurkishText(at: wordRange)
        englishTextView.attributedText = viewModel.highlightedEnglishText(at: wordRange)
    }
}
/*
import UIKit

class ViewController: UIViewController {
    
    let englishTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        //textView.font = UIFont.systemFont(ofSize: 20)
        textView.font = .boldSystemFont(ofSize: 20)
        textView.isEditable = false
        return textView
    }()
    
    let turkishTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.isEditable = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = . white
        view.addSubview(englishTextView)
        view.addSubview(turkishTextView)
        
        let text1 = "Bu bir örnek metin. Bu metinde iki cümle var. İlk cümle burada. İkinci cümle ise burada."
        
        let text2 = "Bu bir örnek metin2. Bu metinde iki cümle var2. İlk cümle burada. İkinci cümle ise burada2."
        englishTextView.text = text1
        turkishTextView.text = text2
        
        let englishTapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(textViewLongPressed(_:)))
        englishTapGestureRecognizer.minimumPressDuration = 0.3 // minimum time the user must press
        englishTextView.addGestureRecognizer(englishTapGestureRecognizer)
        
        let turkishTapGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(textViewLongPressed(_:)))
        turkishTapGestureRecognizer.minimumPressDuration = 0.3 // minimum time the user must press
        turkishTextView.addGestureRecognizer(turkishTapGestureRecognizer)
        
        NSLayoutConstraint.activate([
            englishTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            englishTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            englishTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            englishTextView.heightAnchor.constraint(equalToConstant: 200),
            
            turkishTextView.topAnchor.constraint(equalTo: englishTextView.bottomAnchor, constant: 20),
            turkishTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            turkishTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            turkishTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            turkishTextView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    @objc func textViewLongPressed(_ sender: UILongPressGestureRecognizer) {
        guard let textView = sender.view as? UITextView else { return }
        
        if sender.state == .began {
            let layoutManager = textView.layoutManager
            var location = sender.location(in: textView)
            location.x -= textView.textContainerInset.left
            location.y -= textView.textContainerInset.top
            
            let characterIndex = layoutManager.characterIndex(for: location, in: textView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
            let paragraphRange = (textView.text as NSString).paragraphRange(for: NSRange(location: characterIndex, length: 1))
            
            let selectedRange = (textView.text as NSString).sentenceRange(at: characterIndex)
            
            textView.selectedRange = selectedRange
            
            if textView == englishTextView {
                turkishTextView.selectedRange = selectedRange
            } else {
                englishTextView.selectedRange = selectedRange
            }
            
            // remove highlight from previously selected text
            let attributedText = NSMutableAttributedString(attributedString: textView.attributedText)
            attributedText.removeAttribute(.backgroundColor, range: NSRange(location: 0, length: attributedText.length))
            textView.attributedText = attributedText
            
            if textView == englishTextView {
                turkishTextView.attributedText = attributedText
            } else {
                englishTextView.attributedText = attributedText
            }
            
            // highlight the selected text and change the background color
            let attributes: [NSAttributedString.Key: Any] = [.backgroundColor: UIColor.yellow]
            attributedText.addAttributes(attributes, range: selectedRange)
            textView.attributedText = attributedText
            
            if textView == englishTextView {
                turkishTextView.attributedText = attributedText
            } else {
                englishTextView.attributedText = attributedText
            }
            
            // close the keyboard
            textView.resignFirstResponder()
        }
    }
}
extension NSString {
    func sentenceRange(at index: Int) -> NSRange {
        let delimiters = CharacterSet(charactersIn: ".!")
        let backwardRange = NSRange(location: 0, length: index + 1)
        let backwardIndex = rangeOfCharacter(from: delimiters, options: .backwards, range: backwardRange).location
        
        let forwardRange = NSRange(location: index, length: length - index)
        let forwardIndex = rangeOfCharacter(from: delimiters, options: [], range: forwardRange).location
        
        let sentenceStart = (backwardIndex == NSNotFound) ? 0 : backwardIndex + 1
        let sentenceEnd = (forwardIndex == NSNotFound) ? length - 1 : forwardIndex
        
        return NSRange(location: sentenceStart, length: sentenceEnd - sentenceStart + 1)
    }
}*/
    


/*import UIKit

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
*/
