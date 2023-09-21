//
//  AuthService.swift
//  swift-login-system
//
//  Created by Adarsh Singh on 21/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class AuthService{
    
    public static let shared = AuthService()
    
    private init(){}
    
    
    
    ///  A menthod to register user
    /// - Parameters:
    ///   - userRequest: The user information(email,password, username)
    ///   - completion:  a completion with 2 values
    ///   - Bool: wasRegisterd - determinesif the user was registered and saved in database correctly
    ///    - Error: An optional error if firebase provides onece
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping(Bool, Error?)->Void){
        let username = userRequest.username
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            

            
            guard let resultUser = result?.user else{
                completion(false, nil)
                return
            }
            
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": username,
                    "email": email
                
                ]) { error in
                    
                    if let error = error{
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }
        }
    }
}
