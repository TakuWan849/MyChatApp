//
//  LoginViewController.swift
//  MyChatApp
//
//  Created by 野澤拓己 on 2021/03/10.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK:- Parts
    
    private let scrollView: UIScrollView = {
       let view = UIScrollView()
        view.clipsToBounds = true
        
        return view
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Login"
        label.textAlignment = .center
        
        return label
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.isSecureTextEntry = true
        
        return field
    }()
    
    private let loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        
        return button
    }()
    
    private let createNewUserButton: UIButton = {
       let button = UIButton()
        button.setTitle("Create account", for: .normal)
        button.setTitleColor(.link, for: .normal)
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        emailField.setUnderLine()
        passwordField.setUnderLine()
        
        // AddSubViews
        view.addSubview(scrollView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(createNewUserButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        emailField.setUnderLine()
//        passwordField.setUnderLine()
        
        scrollView.frame = view.bounds
        let logoSize = scrollView.width / 7
        let buttonSize = scrollView.width / 1.1
        
        logoImageView.frame = CGRect(x: (scrollView.width - logoSize) / 2, y: 4, width: logoSize, height: logoSize)
        titleLabel.frame = CGRect(x: (scrollView.width - buttonSize) / 2, y: logoImageView.bottom + 35, width: buttonSize, height: 41)
        emailField.frame = CGRect(x: 0, y: titleLabel.bottom + 100, width: scrollView.width, height: 60)
        passwordField.frame = CGRect(x: 0, y: emailField.bottom, width: scrollView.width, height: 60)
        loginButton.frame = CGRect(x: (scrollView.width - buttonSize) / 2, y: passwordField.bottom + 206, width: buttonSize, height: 56)
        createNewUserButton.frame = CGRect(x: (scrollView.width - buttonSize) / 2, y: loginButton.bottom + 32, width: buttonSize, height: 20)
        
    }

}
