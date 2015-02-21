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
    
    @IBOutlet weak var ActualNameField: UILabel!
    @IBOutlet weak var name: UITableViewCell!
    @IBOutlet weak var bio: UITextView!
    @IBOutlet weak var profilePic: FBProfilePictureView!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    var rootRef = Firebase(url:"https://welearnhackpoly.firebaseio.com/users")
    
    @IBAction func cancelProfileEdit(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toAroundMeFromConfirmProfile", sender: self)
    }
    
    
    @IBAction func doneAddingProfile(segue: UIStoryboardSegue) {
        rootUser.bio = bio.text
        for key in keys {
            if (rootUser.userID == key){            //that is the root user on the database
                var rootFireBaseRef = rootRef.childByAppendingPath(rootUser.userID)
                let updatedRootUserFirebase = [
                "provider": rootUser.provider,
                "email": rootUser.email,
                "first_name": rootUser.name,
                "major": rootUser.major,
                "school": rootUser.school,
                "photoID": rootUser.photo,
                "rep": rootUser.rep,
                "location": rootUser.location,
                "bio": rootUser.bio,
                "badges": rootUser.badges,
                "provider": rootUser.provider,
                "userID": rootUser.userID
                ]
                rootFireBaseRef.setValue(updatedRootUserFirebase)
            } else {
                println("Could not find profile in database")
            }
        }
        
        self.performSegueWithIdentifier("toAroundMeFromConfirmProfile", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: (152/255), blue: 0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        super.viewDidLoad()
        bio.text = rootUser.bio
        println("\(rootUser.name)")
        majorLabel.text = major
        universityLabel.text = university
        profilePic.profileID = rootUser.photo
        ActualNameField.text = rootUser.name
        majorLabel.text = rootUser.major
        universityLabel.text = rootUser.school
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
    
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       if segue.identifier == "returnMajor" {
        println("SAVING MAJOR DETAIL")
           majorLabel.text = major
      }
        if segue.identifier == "PickMajor" {
                let majorPickerViewController = segue.destinationViewController as MajorPickerViewController
                majorPickerViewController.selectedMajor = major
        }
  }
    func textFieldDidBeginEditing(textField: UITextField) {
       textField.placeholder = nil
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.placeholder = rootUser.bio
    }
    
    
    @IBAction func selectedMajor(segue:UIStoryboardSegue) {
        let majorPickerViewController = segue.sourceViewController as MajorPickerViewController
        if let selectedMajor = majorPickerViewController.selectedMajor {
            majorLabel.text = selectedMajor
            major = selectedMajor
            rootUser.major = major
        }
    }
    
    @IBAction func selectedUniversity(segue:UIStoryboardSegue) {
        let universityPickerViewController = segue.sourceViewController as UniversityPickerViewController
        if let selectedUniversity = universityPickerViewController.selectedUniversity {
            universityLabel.text = selectedUniversity
            university = selectedUniversity
            rootUser.school = university
        }
    }
    
    
}