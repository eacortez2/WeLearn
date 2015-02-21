//
//  MainThreadViewController.swift
//  EventHype
//
//  Created by Zachary Feinn on 1/31/15.
//  Copyright (c) 2015 SBHacks. All rights reserved.
//

import UIKit



class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
        var ref = Firebase(url:"https://welearnhackpoly.firebaseio.com/users")
    var nearByPeople:[FireBaseUser] = []
    
    @IBOutlet var tableView: UITableView!
    
    
    //    var questionIndexAry:QuestionIndexCell = ["test question 1", "test question 2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "8PoutVe-1.png")!)
        
        self.tableView.rowHeight = 107
        
        
        
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            var newUser: FireBaseUser =  FireBaseUser(name: " ", major: " ", photo: " ", bio: " ")
            newUser.name = snapshot.value["first_name"] as NSString
            newUser.email = snapshot.value["email"] as NSString
            newUser.photo = snapshot.value["photoID"] as NSString
            newUser.major = snapshot.value["major"] as NSString
            newUser.bio = snapshot.value["bio"] as NSString
            newUser.provider = snapshot.value["provider"] as NSString
            newUser.rep = snapshot.value["rep"] as Int
            self.nearByPeople.append(newUser)
            
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //TABLE setup
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celltest", forIndexPath: indexPath) as ChatTableCell
        
        cell.backgroundColor = UIColor.clearColor()
        cell.contentView.backgroundColor = UIColor.clearColor()
 
        return cell
    }
    

    
    
    @IBAction func returnToAroundMe(sender: AnyObject) {
        
        self.performSegueWithIdentifier("returnToAroundMe", sender: self)
        
    }
    
}

