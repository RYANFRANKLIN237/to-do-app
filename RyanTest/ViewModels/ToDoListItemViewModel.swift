//
//  ToDoListItemViewModel.swift
//  RyanTest
//
//  Created by Jan on 12/07/2025.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewModel : ObservableObject {
    
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
