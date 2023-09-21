//
//  RegisterController.swift
//  swift-login-system
//
//  Created by Adarsh Singh on 20/09/23.
//

import UIKit

class RegisterController: UIViewController {
    
    // Mark: Variable
    private let headerView = AuthHeaderView(title: "Sign Up", subtitle: "Create Your Account")
    
    private let userNameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let signUpBtn = CustomButton(title: "Sign Up", hasBackground: true, fontSize: .big)
    private let signInButton = CustomButton(title: "Already have an Account? Sign In", fontSize: .mid)
    

    
    private let termsTextView: UITextView = {

 
        let attributedString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms and Condition and you acknowledge tha you have read our Privacy Policy")
        attributedString.addAttribute(.link, value: "terms://T&C", range: (attributedString.string as NSString).range(of:"Terms and Condition" ))
        attributedString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attributedString.string as NSString).range(of:"Privacy Policy"))
        
        let tv = UITextView()
        tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue]
        tv.backgroundColor = .clear
        tv.attributedText = attributedString
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.delaysContentTouches = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    // Mark: UIComponent
    
    
    
    // Mark: lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.btnAction()
        self.termsTextView.delegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    
    func btnAction(){
        // Mark: selectors
        self.signUpBtn.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
 
    }
    


}
extension RegisterController{
    
    @objc private func didTapSignUp(){
        
        print("signin")
    }
    
    @objc private func didTapSignIn(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}

extension RegisterController{
    
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(userNameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signUpBtn)
        self.view.addSubview(signInButton)
        self.view.addSubview(termsTextView)
        
        
        
        
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.userNameField.translatesAutoresizingMaskIntoConstraints = false
        self.emailField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        self.signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.termsTextView.translatesAutoresizingMaskIntoConstraints = false
       

        
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
            
            //Email
            self.emailField.topAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 22),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 55),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            //password
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            

            
            //Sign Up Button
            self.signUpBtn.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 22),
            self.signUpBtn.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signUpBtn.heightAnchor.constraint(equalToConstant: 55),
            self.signUpBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.termsTextView.topAnchor.constraint(equalTo: signUpBtn.bottomAnchor, constant: 6),
            self.termsTextView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.termsTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.87),
       
            //Sign In Button
            self.signInButton.topAnchor.constraint(equalTo: termsTextView.bottomAnchor, constant: 11),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 44),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            

            
            

            

            

            
        ])
    }
}

extension RegisterController: UITextViewDelegate{
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        
        if URL.scheme == "privacy"{
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en-US")
            
        }
        if URL.scheme == "terms"{
            
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en-US")
            
        }

        
        return true
    }
    
    private func showWebViewerController(with urlString: String){
        
        let vc = WebViewerController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}

  


