//
//  DetailViewModel.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 10.04.2023.
//

import UIKit
class detailViewModel{
    
    @objc func textViewLongPressed(firstText:UITextView, secondText : UITextView, _ sender: UILongPressGestureRecognizer) {
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
               
               if textView == secondText {
                   firstText.selectedRange = selectedRange
               } else {
                   secondText.selectedRange = selectedRange
               }
               
               // remove highlight from previously selected text
               let attributedText = NSMutableAttributedString(attributedString: textView.attributedText)
               attributedText.removeAttribute(.backgroundColor, range: NSRange(location: 0, length: attributedText.length))
               textView.attributedText = attributedText
               
               if textView == secondText {
                   firstText.attributedText = attributedText
               } else {
                   secondText.attributedText = attributedText
               }
               
               // highlight the selected text and change the background color
               let attributes: [NSAttributedString.Key: Any] = [.backgroundColor: UIColor.yellow]
               attributedText.addAttributes(attributes, range: selectedRange)
               textView.attributedText = attributedText
               
               if textView == secondText {
                   firstText.attributedText = attributedText
               } else {
                   secondText.attributedText = attributedText
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
}

