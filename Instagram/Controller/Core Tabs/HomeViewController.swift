//
//  ViewController.swift
//  Instagram
//
//  Created by 垰野亮 on 4/23/24.
//


import UIKit
import FirebaseAuth

class HomeViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
        
        do {
            try FirebaseAuth.Auth.auth().signOut()
        }
        catch{
            
        }
    }
    
    private func handleNotAuthenticated(){
        
        // Check Auth Status
        if Auth.auth().currentUser == nil{
            // Show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            
            present(loginVC, animated: false)
        }
    }
}

#Preview{
    HomeViewController()
}
