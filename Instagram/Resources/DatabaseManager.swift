//
//  DatabaseManager.swift
//  Instagram
//
//  Created by 垰野亮 on 4/23/24.
//

import Foundation
import FirebaseDatabase

public class DatabaseManager{
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// Check if username and email are available
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    /// Insert new user data to database
    /// - Parameters
    ///     - email: String representing email
    ///     - username: String representing username
    ///     - completion: Async callback for result if database entry succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void){
        database.child(email).setValue(["username": username]){ error, _ in
            if error == nil{
                // Succeeded inserting new user
                completion(true)
                return
            }
            else{
                // Failed to insert
                completion(false)
                return
            }
        }
    }
}
