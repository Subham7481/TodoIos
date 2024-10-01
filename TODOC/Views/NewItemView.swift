//
//  NewItemView.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                TLButton(title: "Save", background: .pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else
                    {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert)
            {
                Alert(title: Text("Error"), message: Text("Please fill all fields and select the due date "))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true
    },set: {
        _ in
    }))
}
