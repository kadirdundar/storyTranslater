//
//  DetailViewModel.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 10.04.2023.
//

import UIKit

// Hikayeler sayfası için ViewModel
class StoryViewModel {
    
    // Hikaye metni
    var storyText: String
    
    init(storyText: String) {
        self.storyText = storyText
    }
    
    // Seçili kelimeyi tespit etmek için kullanılır
    func detectSelectedWord(in range: NSRange) -> String? {
        // Hikaye metninde seçilen kelimeyi bulmak için range kullanılır
        let startIndex = storyText.index(storyText.startIndex, offsetBy: range.location)
        let endIndex = storyText.index(storyText.startIndex, offsetBy: range.location + range.length)
        let selectedWord = String(storyText[startIndex..<endIndex])
        
        // Seçilen kelime boşluk veya özel karakter içeriyorsa tespit edilmediği varsayılır
        let regex = try! NSRegularExpression(pattern: "^[\\w\\d]+$", options: [])
        if regex.firstMatch(in: selectedWord, options: [], range: NSRange(location: 0, length: selectedWord.utf16.count)) == nil {
            return nil
        }
        
        return selectedWord
    }
}
