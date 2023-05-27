//
//  LogInViewModel.swift
//  storyTrasnlateApp
//
//  Created by Kadir Dündar on 6.04.2023.
//

import Foundation
class LoginViewModel {
  var email: String?
  var password: String?
  
  func login(completion: (Bool) -> Void) {
    // Login işlemleri burada gerçekleştirilecek
    // Eğer giriş başarılıysa completion(true) çağrılacak, aksi takdirde completion(false) çağrılacak
  }
    func submitButtonPressed(completion: (Bool) -> Void){
        
        completion(true)
    }
    
    func loginUser() {
           // Giriş işlemleri (veri doğrulama, API çağrısı vb.) burada yapılır.
        
       }
}
