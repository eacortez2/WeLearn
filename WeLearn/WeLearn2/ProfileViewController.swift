//
//  ProfileViewController.swift
//  WeLearn2
//
//  Created by turbs on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var majorLabel: UILabel!
    @IBOutlet weak var profileImage: FBProfilePictureView!
    @IBOutlet weak var bioLabel: UILabel!
    //var profile:  FireBaseUser = FireBaseUser(name: " ", major: " ", photo: " ", bio: " ")
    var profileID:String = ""
    var name: String = ""
    var bio: String = ""
    var major: String = ""
    
    @IBAction func goBackFromProfileToMatches(sender: AnyObject) {
        
        self.performSegueWithIdentifier("returnToAroundMeFromChat", sender: self)
    }
    
//    @IBAction func goBackFromProfileToMatches(segue: UIStoryboardSegue) {
//    }
    
    @IBAction func goToChat(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toChatFromProfile", sender: self)
        
    }
    
    override func viewDidLoad() {

        self.navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: (152/255), blue: 0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()

        
        super.viewDidLoad()
        profileImage.profileID = profileID
        nameLabel.text = name
        bioLabel.text = bio
        majorLabel.text = major
//        profileImage.profileID = profile.userID
//        nameLabel.text = profile.name
//        bioLabel.text = profile.bio
//        majorLabel.text = profile.major

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 }
