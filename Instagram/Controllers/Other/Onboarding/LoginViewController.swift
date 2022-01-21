//
//  LoginViewController.swift
//  Instagram
//
//  Created by Ivan Potapenko on 21.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let headerView: UIView = {
        let view = UIView()
        
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
        view.addSubview(headerView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
    }

    @objc private func didTapLoginButton() {
        
    }
    
    @objc private func didTapTermsButton() {
        
    }
    
    @objc private func didTapPrivacyButton() {
        
    }
    
    @objc private func didTapCreateAccountButton() {
        
    }
    
}
