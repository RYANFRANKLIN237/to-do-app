//
//  ProfileView.swift
//  RyanTest
//
//  Created by Jan on 12/07/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    init(){
        
    }
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                  profile(user: user)
                }else {
                    Text("Loading Profile")
                }
                
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user:User) -> some View{
        //avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125,height: 125)
            .padding()
        
        //info: name,email, member since
        VStack(alignment: .leading){
            HStack{
                Text("Name :")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email :")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Member Since :")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
        }.padding()
        
        //sign out button
        Button("Log Out"){
            viewModel.logout()
        }
        .tint(.red)
        .padding()
     }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
