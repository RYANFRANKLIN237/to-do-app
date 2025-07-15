//
//  ContentView.swift
//  RyanTest
//
//  Created by Jan on 10/07/2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        
        Group {
                   if viewModel.isLoadingAuth {
                       // Show a loading indicator while checking auth state
                       ProgressView("Loading...")
                   } else if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
                       // User is signed in, show home screen
                       accountView
                   } else {
                       // User is not signed in, show login screen
                       LoginView()
                   }
               }
    }
    
    @ViewBuilder
     var accountView: some View{
         TabView{
             ToDoListView(userId: viewModel.currentUserId)
                 .tabItem {
                     Label("Home", systemImage: "house")
                 }
             
             ProfileView()
                 .tabItem {
                     Label("Profile", systemImage: "person.circle")
                 }
         }
     }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
