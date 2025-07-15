//
//  MainViewModel.swift
//  RyanTest
//
//  Created by Jan on 12/07/2025.
//
import FirebaseAuth
import Foundation

class MainViewModel : ObservableObject {
    @Published var currentUserId: String = ""
    @Published var isLoadingAuth: Bool = true // New property to indicate auth state is being checked
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        // Set isLoadingAuth to true initially
               self.isLoadingAuth = true
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                self?.isLoadingAuth = false
            }
           }
    }
    
    deinit {
            if let handler = handler {
                Auth.auth().removeStateDidChangeListener(handler)
            }
        }
    
    public var isSignedIn:Bool {
        return Auth.auth().currentUser != nil
    }
}
