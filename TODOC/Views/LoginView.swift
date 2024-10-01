//
//  LoginView.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    @State var password = ""
    var body: some View {
        NavigationView{
        VStack{
            //Header
            HeaderView(title: "To Do List",
                       subtitle: "Get things done",
                       angle: 15,
                       background: .pink)
            Form{
            if !viewModel.errorMessage.isEmpty{
                Text(viewModel.errorMessage).foregroundColor(.green)
            }
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Log In", background: .blue){
                    viewModel.login()
                }
                //.padding()
            }
            .offset(y: -50)
            //create account
            
            VStack{
                Text("First time here?")
               
                NavigationLink("Create Account",
                               destination: RegisterView())
            }.padding(.bottom,50)
            
            Spacer()
        }
    }
    }
}

#Preview {
    LoginView()
}
