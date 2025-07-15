//
//  LoginViewModel.swift
//  RyanTest
//
//  Created by Ryan on 12/07/2025.
//
import FirebaseAuth
import Foundation

class LoginViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    
    func login(){
        guard validate() else {
            return
        }
        
       //log user in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
   private  func validate() -> Bool{
       errorMessage = ""
       guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
           errorMessage = "Please fill in all required fields"
           return false
       }
       
       guard email.contains("@") && email.contains(".") else{
           errorMessage = "please input valid email"
           return false
       }
       
       return true
   }
}
