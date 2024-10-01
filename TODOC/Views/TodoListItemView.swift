//
//  TodoListItemView.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated,time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "circle.checkmark.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct TodoListItemView_Preview: PreviewProvider{
    static var previews: some View{
        TodoListItemView(item: .init(id: "123",
                                     title: "let's meet",
                                     dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970,
                                     isDone: true))
    }
}
