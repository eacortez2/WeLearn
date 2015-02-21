//
//  confirmAccountViewController.swift
//  WeLearn2
//
//  Created by turbs on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import Foundation
import UIKit

class confirmAccountViewController: UITableViewController {
    
    @IBOutlet weak var name: UITableViewCell!
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var profilePic: UIView!
    
    @IBAction func doneAddingProfile(sender: UIBarButtonItem) {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}