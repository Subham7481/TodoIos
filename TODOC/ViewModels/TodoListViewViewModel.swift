//
//  TodoListViewViewModel.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import Foundation
import FirebaseFirestore
class TodoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    func deleteItem(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
