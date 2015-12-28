//
//  MasterViewController.swift
//  MusicMaps
//
//  Created by Allen Su on 12/28/15.
//  Copyright © 2015 Allen Su. All rights reserved.
//

import UIKit
import PureLayout
import Parse

let musicCellIdentifier = "musicCell"

class MasterViewController: UIViewController {
    
    var tableView: UITableView!
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        validateUser()
    }
    
    // MARK: UserValidation
    
    func validateUser(){
        if (PFUser.currentUser() == nil) {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let signUpController = SignUpViewController()
                self.presentViewController(signUpController, animated: true, completion: nil)
            })
        }
    }
    
    // MARK: UISetup
    
    func setupViews() {
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: musicCellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.OnDrag;
    }
    
    func setupConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
    }

}

extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let musicCell = tableView.dequeueReusableCellWithIdentifier(musicCellIdentifier)! as UITableViewCell
        musicCell.textLabel?.text = "music"
        
        return musicCell
    }
}