//
//  RegisterViewController.swift
//  MyChatApp
//
//  Created by 野澤拓己 on 2021/03/10.
//

import UIKit

class RegisterViewController: UIViewController {
    
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
        label.text = "Create accout"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 34, weight: .bold)
        
        return label
    }()
    
    private let firstNameLabel: UITextField = {
        let field = UITextField()
        field.placeholder = "First name"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.layer.shadowColor = UIColor.lightGray.cgColor
        field.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        field.layer.shadowOpacity = 1.0
        field.layer.shadowRadius = 0.0
        
        return field
    }()
    
    private let lastNameLabel: UITextField = {
        let field = UITextField()
        field.placeholder = "Last name"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.layer.shadowColor = UIColor.lightGray.cgColor
        field.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        field.layer.shadowOpacity = 1.0
        field.layer.shadowRadius = 0.0
        
        return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.layer.shadowColor = UIColor.lightGray.cgColor
        field.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        field.layer.shadowOpacity = 1.0
        field.layer.shadowRadius = 0.0
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        
        field.isSecureTextEntry = true
        
        // fieldに下線を引く
        field.layer.shadowColor = UIColor.lightGray.cgColor
        field.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        field.layer.shadowOpacity = 1.0
        field.layer.shadowRadius = 0.0
        
        return field
    }()
    
    private let loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Create accout", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign In", style: .plain, target: self, action: #selector(handleBack))
        
        // AddSubViews
        view.addSubview(scrollView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(firstNameLabel)
        scrollView.addSubview(lastNameLabel)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        let logoSize = scrollView.width / 7
        let buttonSize = scrollView.width / 1.1
        
        logoImageView.frame = CGRect(x: (scrollView.width - logoSize) / 2, y: 20, width: logoSize, height: logoSize)
        titleLabel.frame = CGRect(x: (scrollView.width - buttonSize) / 2, y: logoImageView.bottom + 35, width: buttonSize, height: 41)
        firstNameLabel.frame = CGRect(x: 10, y: titleLabel.bottom + 70, width: scrollView.width - 20, height: 60)
        lastNameLabel.frame = CGRect(x: 10, y: firstNameLabel.bottom+5, width: scrollView.width - 20, height: 60)
        emailField.frame = CGRect(x: 10, y: lastNameLabel.bottom+5, width: scrollView.width - 20, height: 60)
        passwordField.frame = CGRect(x: 10, y: emailField.bottom+5, width: scrollView.width - 20, height: 60)
        loginButton.frame = CGRect(x: (scrollView.width - buttonSize) / 2, y: passwordField.bottom + 76, width: buttonSize, height: 56)
        
    }
    
    @objc private func handleBack() {
        navigationController?.popViewController(animated: true)
    }

}

