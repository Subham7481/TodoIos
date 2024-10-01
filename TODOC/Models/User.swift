//
//  User.swift
//  TODOC
//
//  Created by Subham Patel on 25/09/24.
//

import Foundation
struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
