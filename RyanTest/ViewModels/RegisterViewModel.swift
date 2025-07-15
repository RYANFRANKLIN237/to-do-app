//
//  RegisterViewModel.swift
//  RyanTest
//
//  Created by Jan on 12/07/2025.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel : ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {}
    
    func register(){
        guard validate() else {
            return
        }
        
       //register user
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result,error in
            guard let userId =  result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userId)
            
        }
    }
    
    private func insertUserRecord(id:String){
        
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private  func validate() -> Bool{
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all required fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "please input valid email"
            return false
        }
        
        guard password.count >= 6  else {
            return false
        }
        
        return true
    }
}
