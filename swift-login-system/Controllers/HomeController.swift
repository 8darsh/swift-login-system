//
//  HomeController.swift
//  swift-login-system
//
//  Created by Adarsh Singh on 20/09/23.
//

import UIKit

class HomeController: UIViewController {
    
    private let Label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.text = "Loading..."
        label.numberOfLines = 2
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.Label.text = "Adarsh\nadarsingh2002@gmail.com"
    }


}
extension HomeController{
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(didTapLogout))
        self.view.addSubview(Label)
        Label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.Label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.Label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            
        ])
    }
}
extension HomeController{
    
    @objc func didTapLogout(){
        
    }
}
