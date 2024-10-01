//
//  TodoListItemViewViewModel.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class TodoListItemViewViewModel: ObservableObject{
   
    init(){
        
    }
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
