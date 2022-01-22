//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Ivan Potapenko on 21.01.2022.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    ///   Check if username and email is available
    ///  - Parameters
    ///  - email: String representing email
    ///  - username: String representing username
    public func canCreateNewUser(email:String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    ///   Inserts new user data to database
    ///  - Parameters
    ///  - email: String representing email
    ///  - username: String representing username
    ///  - completion: Async callback for result if database entry succeeded
    public func insertNewUser(email:String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            }
            else {
                // failed
                completion(false)
                return
            }
        }
    }
    
}
