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
    
    public func SignIn(with userRequest: LoginUserRequest, completion: @escaping(Error?)->Void){
        
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error = error{
                completion(error)
                return
            }else{
                completion(nil)
            }
        }
    }
    
    public func SignOut(completion: @escaping(Error?)->Void){
        
        do{
            try Auth.auth().signOut()
            completion(nil)
            
        }catch{
            completion(error)
        }
    }
    
    public func forgotPassword(with email: String, completion: @escaping(Error?)->Void){
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] error in
            guard let self else {return}
            completion(error)
        }
    }
    
    public func fetchUser(completion: @escaping (User?, Error?)->Void){
        guard let userUId = Auth.auth().currentUser?.uid else {return}
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userUId)
            .getDocument { snapshot, error in
                
                if let error = error{
                    completion(nil,error)
                    return
                }
                
                
                if let snapshot = snapshot,
                   let snapshotData = snapshot.data(),
                   let username = snapshotData["username"] as? String,
                   let email = snapshotData["email"] as? String{
                    let user = User(email: email, username: username, userUID: userUId)
                    
                    completion(user,nil)
                }
                   
                   
            }
        
    }
}
