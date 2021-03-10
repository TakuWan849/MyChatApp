//
//  ViewController.swift
//  MyChatApp
//
//  Created by 野澤拓己 on 2021/03/10.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    private func validateAuth() {
        
        // Bool型を読み取るKeyに対応する値がなかったら、falseが返ってくる
        let isLoggedIn = UserDefaults.standard.bool(forKey: "logged_in")
        
        if !isLoggedIn {
            let loginVc = LoginViewController()
            let nav = UINavigationController(rootViewController: loginVc)
            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
        }
        
        
    }


}

