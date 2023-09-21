//
//  AlertManager.swift
//  swift-login-system
//
//  Created by Adarsh Singh on 21/09/23.
//

import UIKit

class AlertManager{
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String){
        DispatchQueue.main.async {
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            vc.present(ac, animated: true)
        }

    }
}

//validation alerts
extension AlertManager{
    
     static func showInvalidEmailAlert(on vc: UIViewController){
        
        self.showBasicAlert(on: vc, title: "Inavlid Email", message: "Please enter valid email")
    }
    static func showInvalidPasswordAlert(on vc: UIViewController){
       
       self.showBasicAlert(on: vc, title: "Inavlid Password", message: "Please enter valid Password")
   }
    static func showInvalidUsernameAlert(on vc: UIViewController){
       
       self.showBasicAlert(on: vc, title: "Inavlid Username", message: "Please enter valid Username")
   }
    
}


//registration error
extension AlertManager{
    
    static func showRegistrationErrorAlert(on vc: UIViewController){
       
       self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: "")
   }
    static func showRegistrationErrorAlert(on vc: UIViewController, with error: Error){
       
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: "\(error.localizedDescription)")
   }
}

//login errors

extension AlertManager{
    
    static func showSignInErrorAlert(on vc: UIViewController){
       self.showBasicAlert(on: vc, title: "Unknown Error Signing In", message: "")
   }
    static func showSignInErrorAlert(on vc: UIViewController, with error: Error){
       self.showBasicAlert(on: vc, title: "Error Signing In", message: "\(error.localizedDescription)")
   }
}


//logout error

extension AlertManager{
    
    static func showLogoutErrorAlert(on vc: UIViewController, with error: Error){
       self.showBasicAlert(on: vc, title: "Logout Error", message: "\(error.localizedDescription)")
   }
}

// forgot password

extension AlertManager{
    
    
    static func showPasswordResetSent(on vc: UIViewController){
       self.showBasicAlert(on: vc, title: "Password Reset Sent", message: "")
   }
    
    static func showErrorSendingPasswordReset(on vc: UIViewController, with error: Error){
       self.showBasicAlert(on: vc, title: "Error Sending Password Reset", message: "\(error.localizedDescription)")
   }
}

// fetching user error

extension AlertManager{
    
    static func showFetchingUserError(on vc: UIViewController, with error: Error){
       self.showBasicAlert(on: vc, title: "Error Fetching User", message: "\(error.localizedDescription)")
   }
    
    static func showUnkownFetchingUserError(on vc: UIViewController){
       self.showBasicAlert(on: vc, title: "Unkown Error Fetching User", message: "")
   }
}

