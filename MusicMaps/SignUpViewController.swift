//
//  SignUpViewController.swift
//  MusicMaps
//
//  Created by Allen Su on 12/28/15.
//  Copyright © 2015 Allen Su. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupParse()
    }
    
    // MARK: UISetup
    
    func setupViews() {
        view.backgroundColor = UIColor.whiteColor()
    }
    
    // MARK: ServerCall
    
    func setupParse(){
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
    }
    
}
