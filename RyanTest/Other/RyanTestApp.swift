//
//  RyanTestApp.swift
//  RyanTest
//
//  Created by Ryan on 10/07/2025.
//
import FirebaseCore
import SwiftUI

@main
struct RyanTestApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
