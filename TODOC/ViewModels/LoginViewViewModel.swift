//
//  LoginViewViewModel.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import Foundation
import FirebaseAuth
class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
      guard validate() else
        {
         return
      }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                    guard let userid = result?.user.uid else {
                        self?.errorMessage = "invalid credentials"
                        return
                    }
                }
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            errorMessage = "Please fill all fields."
            return false
        }
        guard email.contains("@") && email.contains(".")else
        {
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
