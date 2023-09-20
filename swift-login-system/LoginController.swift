//
//  LoginController.swift
//  swift-login-system
//
//  Created by Adarsh Singh on 20/09/23.
//

import UIKit

class LoginController: UIViewController {
    
    // Mark: Variable
    private let headerView = AuthHeaderView(title: "Sign In", subtitle: "Sign in to your account")
    
    private let userNameField = CustomTextField(fieldType: .username)
   
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signinBtn = CustomButton(title: "Sign In", hasBackground: true, fontSize: .big)
    
    private let newUserButton = CustomButton(title: "New User? Create Account", fontSize: .mid)
    
    private let forgotPasswordButton = CustomButton(title: "Forgot Password", fontSize: .small)
    
    // Mark: UIComponent
    
    
    
    // Mark: lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.btnAction()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
        self.didTapNewUser()
    }
    
    
    func btnAction(){
        // Mark: selectors
        self.signinBtn.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
    }
    


}

extension LoginController{
    
    @objc private func didTapSignIn(){
        let vc = HomeController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc,animated: false,completion: nil)
        
    }
    
    @objc private func didTapNewUser(){
        let vc = RegisterController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func didTapForgotPassword(){
        let vc = ForgotController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginController{
    
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(userNameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signinBtn)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPasswordButton)
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        userNameField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signinBtn.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            
            //header
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint (equalTo:self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            
            //username
            self.userNameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.userNameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.userNameField.heightAnchor.constraint(equalToConstant: 55),
            self.userNameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            

            
            //password
            self.passwordField.topAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 12),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            //Sign In Button
            self.signinBtn.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 12),
            self.signinBtn.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signinBtn.heightAnchor.constraint(equalToConstant: 55),
            self.signinBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            //New User Button
            self.newUserButton.topAnchor.constraint(equalTo: signinBtn.bottomAnchor, constant: 11),
            self.newUserButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.newUserButton.heightAnchor.constraint(equalToConstant: 44),
            self.newUserButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            //Forgot Password
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: newUserButton.bottomAnchor, constant:6),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
        ])
    }
}
