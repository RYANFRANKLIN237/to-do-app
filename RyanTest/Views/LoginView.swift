//
//  LoginView.swift
//  RyanTest
//
//  Created by Jan on 12/07/2025.
//

import SwiftUI

struct LoginView: View {
    
   @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationView {
            VStack{
                //header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                
               
                //login form
                Form{
                    
                    if  !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Login", background: .blue, action: {
                        //attempt log in
                        viewModel.login()
                    })
                    
                }.offset(y:-50)
                
                
                //create account
                
                VStack{
                    Text("New Around here?")
                    
                   
                    NavigationLink("Create an Account", destination: RegisterView())
                   
                }.padding(.bottom, 50)
                
                Spacer()
            }
        }
       
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
