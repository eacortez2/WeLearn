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
    
    var major:String = "Computer Science"
    var university:String = "Santa Barbara City College"
    
    @IBOutlet weak var name: UITableViewCell!
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var profilePic: UIView!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    
    @IBAction func goBackFromProfileToMatches(segue: UIStoryboardSegue) {
    }
    
    @IBAction func doneAddingProfile(segue: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        majorLabel.text = major
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func selectedMajor(segue:UIStoryboardSegue) {
        let majorPickerViewController = segue.sourceViewController as MajorPickerViewController
        if let selectedMajor = majorPickerViewController.selectedMajor {
            majorLabel.text = selectedMajor
            major = selectedMajor
        }
    }
    
    @IBAction func selectedUniversity(segue:UIStoryboardSegue) {
        let universityPickerViewController = segue.sourceViewController as MajorPickerViewController
        if let selectedUniversity = universityPickerViewController.selectedMajor {
            universityLabel.text = selectedUniversity
            university = selectedUniversity
        }
    }
    
    
}