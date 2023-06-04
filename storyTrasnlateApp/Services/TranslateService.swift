//
//  TranslateService.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 3.06.2023.
//

import Foundation

import Foundation

func translateWord(_ word: String, completion: @escaping (String) -> Void) {
    let apiKey = "d7864877ad80c97a7ef4" // MyMemory API anahtarınızı buraya girin
    let sourceLanguage = "en"
    let targetLanguage = "tr"
    
    var urlComponents = URLComponents(string: "https://api.mymemory.translated.net/get")
    urlComponents?.queryItems = [
        URLQueryItem(name: "q", value: word),
        URLQueryItem(name: "langpair", value: "\(sourceLanguage)|\(targetLanguage)"),
        URLQueryItem(name: "key", value: apiKey)
    ]
    
    guard let url = urlComponents?.url else {
        print("Geçersiz URL")
        return
    }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("API isteği sırasında hata: \(error)")
            return
        }
        
        guard let data = data else {
            print("API'den veri alınamadı")
            return
        }
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let responseData = json["responseData"] as? [String: Any],
               let translatedText = responseData["translatedText"] as? String {
                DispatchQueue.main.async {
                    completion(translatedText)
                }
            } else {
                print("JSON çözümleme hatası")
            }
        } catch {
            print("JSON çözümleme sırasında hata: \(error)")
        }
    }
    
    task.resume()
}
