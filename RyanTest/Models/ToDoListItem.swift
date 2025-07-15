//
//  ToDoListItem.swift
//  RyanTest
//
//  Created by Ryan on 12/07/2025.
//

import Foundation

struct ToDoListItem : Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
    
}

