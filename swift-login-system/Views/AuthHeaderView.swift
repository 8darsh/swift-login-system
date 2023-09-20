//
//  AuthHeaderView.swift
//  swift-login-system
//
//  Created by Adarsh Singh on 20/09/23.
//

import UIKit

class AuthHeaderView: UIView {
    
    // Mark: UIComponent
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage (named: "logo")
        return iv
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Error"
        return label
    }()
    private let subTitleLabel: UILabel = {
        let label = UILabel ()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont (ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()
    
    
    
    
    // Mark: LifeCycle
    init(title: String, subtitle: String){
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subtitle
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Mark: UI Setup
    
    private func setupUI(){
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)


        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 90),
                                                
            self.logoImageView.heightAnchor.constraint (equalTo:logoImageView.widthAnchor),
            
            
            self.titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 19),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            

            
            
        ])
    }
    
}
