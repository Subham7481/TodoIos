//
//  RegisterView.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        HeaderView(title: "Register",
                   subtitle: "Start organizing ToDos",
                   angle: -15,
                   background: .orange)
        Form{
            TextField("Full name:",text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            TextField("Email address:",text: $viewModel.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
            SecureField("Password:",text: $viewModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            TLButton(title: "Create Account ", background: .green){
                viewModel.register()
                //Attempt registration
            }
            .padding()
        }
        .offset(y: -50)
        Spacer()
    }
}

#Preview {
    RegisterView()
}
