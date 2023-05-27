//
//  DetailModel.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 14.04.2023.
//

import Foundation

class Word: NSObject {
    var turkishWord: String
    var id: UUID
    
    init(turkishWord: String, id: UUID) {
        self.turkishWord = turkishWord
        self.id = id
    }
}
