//
//  NewItemView.swift
//  RyanTest
//
//  Created by Jan on 12/07/2025.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,100)
            
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .pink, action: {
                    if(viewModel.canSave){
                        //save to do item
                        viewModel.save()
                        newItemPresented = false
                    }else {
                        viewModel.showAlert = true
                    }
                    
                   
                })
                
                
            }.alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"),message: Text("Please fill in title and select date after today"))
            }
            
            
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get:{
            return true
        }, set: ({ _ in
            
        })))
    }
}
