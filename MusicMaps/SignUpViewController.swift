//
//  SignUpViewController.swift
//  MusicMaps
//
//  Created by Allen Su on 12/28/15.
//  Copyright © 2015 Allen Su. All rights reserved.
//

import UIKit
import Parse
import PureLayout

class SignUpViewController: UIViewController {
    
    var usernameTextField = UITextField()
    var passwordTextField = UITextField()
    var signUpButton = UIButton()
    
    var didSetupConstraints = false
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: UISetup
    
    func setupViews() {
        view.backgroundColor = UIColor.whiteColor()
        usernameTextField.placeholder = "username"
        passwordTextField.placeholder = "password"
        usernameTextField.textAlignment = .Center
        passwordTextField.textAlignment = .Center
        signUpButton.setTitle("Sign Up", forState: .Normal)
        signUpButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)
        
        view.setNeedsUpdateConstraints()
        view.updateConstraintsIfNeeded()
    }
    
    //MARK: PureLayout
    
    override func updateViewConstraints() {
        
        if !didSetupConstraints {
            didSetupConstraints = true
            usernameTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            signUpButton.translatesAutoresizingMaskIntoConstraints = false
            
            usernameTextField.autoSetDimension(.Width, toSize: 160.0)
            usernameTextField.autoSetDimension(.Height, toSize: 44.0)
            usernameTextField.autoCenterInSuperview()
            
            passwordTextField.autoPinEdge(.Top, toEdge: .Bottom, ofView: usernameTextField, withOffset: 16.0)
            passwordTextField.autoSetDimension(.Width, toSize: 160.0)
            passwordTextField.autoSetDimension(.Height, toSize: 44.0)
            passwordTextField.autoAlignAxis(.Vertical, toSameAxisOfView: usernameTextField)
            
            signUpButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: passwordTextField, withOffset: 16.0)
            signUpButton.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: view, withOffset: -16.0)
            signUpButton.autoSetDimension(.Width, toSize: 160.0)
            signUpButton.autoAlignAxis(.Vertical, toSameAxisOfView: usernameTextField)
            
        }
        super.updateViewConstraints()
    }
    
}
