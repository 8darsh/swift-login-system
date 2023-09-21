//
//  WebViewerController.swift
//  swift-login-system
//
//  Created by Adarsh Singh on 20/09/23.
//

import UIKit
import WebKit
class WebViewerController: UIViewController {
    
    private let urlString: String
    private let webView = WKWebView()
    init(with urlString: String){
        self.urlString = urlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        guard let url = URL(string: urlString) else {
            self.dismiss(animated: true)
            return
        }
        
        self.webView.load(URLRequest(url: url))
    }
    


}
extension WebViewerController{
    
    private func setupUI(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        self.view.addSubview(webView)
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.webView.leadingAnchor.constraint(equalTo:
                                                self.view.leadingAnchor),
            self.webView.trailingAnchor.constraint (equalTo:
                                                self.view.trailingAnchor),
          
            
            
            
        ])
    }
    
    @objc func didTapDone(){
        self.dismiss(animated: true)
    }
}
