//
//  confirmAccountViewController.swift
//  WeLearn2
//
//  Created by turbs on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import Foundation
import UIKit

class confirmAccountViewController: UITableViewController, UITextFieldDelegate {
    
    var major:String = "Computer Science"
    var university:String = "Santa Barbara City College"
    
    @IBOutlet weak var name: UITableViewCell!
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var profilePic: UIView!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    
    @IBAction func cancelProfileEdit(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toAroundMeFromConfirmProfile", sender: self)
    }
    
    
    @IBAction func doneAddingProfile(segue: UIStoryboardSegue) {
        
        self.performSegueWithIdentifier("toAroundMeFromConfirmProfile", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("\(rootUser.name)")
        majorLabel.text = major
        universityLabel.text = university
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
//    if segue.identifier == "PickMajor" {
//    let majorPickerViewController = segue.destinationViewController as MajorPickerViewController
//    majorPickerViewController.selectedMajor = major
//    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "SaveMajorDetail" {
//            major = 
//                Player(name: nameTextField.text, game:game, rating: 1)
//        }
//    }
    
    
    
    
    @IBAction func selectedMajor(segue:UIStoryboardSegue) {
        let majorPickerViewController = segue.sourceViewController as MajorPickerViewController
        if let selectedMajor = majorPickerViewController.selectedMajor {
            majorLabel.text = selectedMajor
            major = selectedMajor
        }
    }
    
    @IBAction func selectedUniversity(segue:UIStoryboardSegue) {
        let universityPickerViewController = segue.sourceViewController as UniversityPickerViewController
        if let selectedUniversity = universityPickerViewController.selectedUniversity {
            universityLabel.text = selectedUniversity
            university = selectedUniversity
        }
    }
    
    
}