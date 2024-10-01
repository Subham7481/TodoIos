//
//  TodoListView.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items) {item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.deleteItem(id: item.id)
                            }.tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }.navigationTitle("To Do List")
                .toolbar{
                    Button{
                        //Action
                        viewModel.showingNewItemView = true
                    } label: {
                       Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
        }
    }
}
struct TodoListView_Previews: PreviewProvider{
    static var previews: some View{
        TodoListView(userId: "")
    }
}
//#Preview {
//    TodoListView(userId: <#T##String#>)
//}
