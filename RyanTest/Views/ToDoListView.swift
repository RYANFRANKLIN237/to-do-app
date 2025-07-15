//
//  ToDoListItemsView.swift
//  RyanTest
//
//  Created by Jan on 12/07/2025.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel:ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
   
    init(userId:String){
        self._items = FirestoreQuery(
        collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To do list")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label:{
                    Image(systemName:"plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
                
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        
        ToDoListView(userId: "JpDK3nXdZOZvU1hP4rWeGaMvHp93")
    }
}
