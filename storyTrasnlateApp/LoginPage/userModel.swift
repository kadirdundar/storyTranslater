//
//  userModel.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 6.04.2023.
//

import Foundation
class User {
  var email: String
  var password: String
  
  init(email: String, password: String) {
    self.email = email
    self.password = password
  }
}
