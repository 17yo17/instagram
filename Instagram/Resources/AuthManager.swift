//
//  AuthManager.swift
//  Instagram
//
//  Created by 垰野亮 on 4/23/24.
//
import FirebaseAuth

public class AuthManager{
    static let shared = AuthManager()
    
    // MARK: - Public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void){
        /*
         - Check if username available
         - Check if email available
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username){ canCreate in
            if canCreate{
                /*
                 - Create Account
                 - Insert an account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password){ result, error in
                    guard error == nil, result != nil else{
                        // Firebase auth could not create an account
                        completion(false)
                        return
                    }
                    
                    // insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username){ inserted in
                        if inserted{
                            // Succeeded to inesrt to database
                            completion(true)
                            return
                        }
                        else{
                            //
                            completion(false)
                            return
                        }
                    }
                }
            }
            else{
                // either username or email does not exist
                completion(false)
            }
        }
    }
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void){
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
                guard authResult != nil, error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            // username log in
            print(username)
        }
    }
}
