//
//  DetailViewModel.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 10.04.2023.
//

import Foundation
import UIKit

class TextViewModel {
    var selectedSentenceIndex: Int?

    let turkishText = """
    Türkçe metin burada yer alacak. Bu metin, İngilizce karşılığıyla eşit uzunlukta olacak. Amacımız, seçilen cümlelerin diğer dildeki karşılığını göstermek.
    """
    
    let englishText = """
    English text will be displayed here. This text will be of equal length to its Turkish counterpart. Our goal is to display the equivalent sentence in the other language when a sentence is selected.
    """
  
    func turkishRange(for index: Int) -> NSRange {
        let text = NSString(string: turkishText)
        let regex = try! NSRegularExpression(pattern: "(.*?\\.)(?=(\\s|$))", options: [])
        let range = NSRange(location: 0, length: text.length)
        let matches = regex.matches(in: turkishText, options: [], range: range)
        for match in matches {
            if NSLocationInRange(index, match.range) {
                return match.range
            }
        }
        return NSRange(location: 0, length: 0)
    }
    
    func englishRange(for index: Int) -> NSRange {
        let text = NSString(string: englishText)
        let regex = try! NSRegularExpression(pattern: "(.*?\\.)(?=(\\s|$))", options: [])
        let range = NSRange(location: 0, length: text.length)
        let matches = regex.matches(in: englishText, options: [], range: range)
        for match in matches {
            if NSLocationInRange(index, match.range) {
                return match.range
            }
        }
        return NSRange(location: 0, length: 0)
    }
    
    func highlightedTurkishText(at range: NSRange) -> NSAttributedString {
        let text = NSMutableAttributedString(string: turkishText)
        text.addAttribute(.backgroundColor, value: UIColor.yellow, range: range)
        return text
    }
    
    func highlightedEnglishText(at range: NSRange) -> NSAttributedString {
        let text = NSMutableAttributedString(string: englishText)
        text.addAttribute(.backgroundColor, value: UIColor.yellow, range: range)
        return text
    }
    
    func highlightedTurkishSentence(at index: Int) -> NSAttributedString {
            let text = NSMutableAttributedString(string: turkishText)
            let regex = try! NSRegularExpression(pattern: "(.*?\\.)(?=(\\s|$))", options: [])
            let range = NSRange(location: 0, length: text.length)
            let matches = regex.matches(in: turkishText, options: [], range: range)
            for match in matches {
                if index == matches.firstIndex(of: match),
                   let selectedSentenceIndex = selectedSentenceIndex,
                   index == selectedSentenceIndex {
                    text.addAttribute(.backgroundColor, value: UIColor.orange, range: match.range)
                } else {
                    text.addAttribute(.backgroundColor, value: UIColor.clear, range: match.range)
                }
            }
            return text
        }
        
        func highlightedEnglishSentence(at index: Int) -> NSAttributedString {
            let text = NSMutableAttributedString(string: englishText)
            let regex = try! NSRegularExpression(pattern: "(.*?\\.)(?=(\\s|$))", options: [])
            let range = NSRange(location: 0, length: text.length)
            let matches = regex.matches(in: englishText, options: [], range: range)
            for match in matches {
                if index == matches.firstIndex(of: match),
                   let selectedSentenceIndex = selectedSentenceIndex,
                   index == selectedSentenceIndex {
                    text.addAttribute(.backgroundColor, value: UIColor.orange, range: match.range)
                } else {
                    text.addAttribute(.backgroundColor, value: UIColor.clear, range: match.range)
                }
            }
            return text
        }
    }

