//
//  ToDoListViewModel.swift
//  RyanTest
//
//  Created by Jan on 12/07/2025.
//
import FirebaseFirestore
import Foundation

class ToDoListViewModel : ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId:String
    init(userId:String) {
        self.userId = userId
        
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
