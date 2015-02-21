//
//  aroundMeViewController.swift
//  WeLearn2
//
//  Created by turbs on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import UIKit



class AroundMeViewController: UITableViewController, UITableViewDataSource {
    
    @IBOutlet var tableViewData: UITableView!
    //temporary for testing before FireBase hookup
    //let students: [FireBaseUser] = fakeData
    //var nearByPeople:[FireBaseUser] = []
    var ref = Firebase(url:"https://welearnhackpoly.firebaseio.com/users")
    var count: Int = 0
    var nearByPeople:[FireBaseUser] = []
    var profileToShow: FireBaseUser = FireBaseUser(name: " ", major: " ", photo: " ", bio: " ")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 1, green: (152/255), blue: 0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 214/255, green: (214/255), blue: 214/255, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        
        ref.observeEventType(.ChildAdded, withBlock: { snapshot in
            var newUser: FireBaseUser =  FireBaseUser(name: " ", major: " ", photo: " ", bio: " ")
            newUser.name = snapshot.value["first_name"] as NSString
            newUser.email = snapshot.value["email"] as NSString
            newUser.photo = snapshot.value["photoID"] as NSString
            newUser.major = snapshot.value["major"] as NSString
            newUser.bio = snapshot.value["bio"] as NSString
            newUser.provider = snapshot.value["provider"] as NSString
            newUser.rep = snapshot.value["rep"] as Int
            newUser.userID = snapshot.value["userID"] as NSString
            if(newUser.userID != rootUser.userID){
                self.nearByPeople.append(newUser)
                self.tableViewData.reloadData()
                println("\(newUser.photo)")
            }else {
                println("Don't add because root user.")
            }
            //println("\(newUser.name)")
            
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return nearByPeople.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("StudentMatchCell", forIndexPath: indexPath) as StudentMatchCell

        let student = nearByPeople[indexPath.row] as FireBaseUser
        
        cell.nameLabel.text = student.name
        cell.majorLabel.text = student.major
        cell.cellPicture.profileID = student.photo

        
        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        profileToShow = nearByPeople[indexPath.row]
        //println("\(profileToShow.major)")
        
        self.performSegueWithIdentifier("toBioFromAroundMe", sender: self)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toBioFromAroundMe"{
            var profileViewController = segue.destinationViewController.topViewController as ProfileViewController
            profileViewController.name = profileToShow.name
            profileViewController.profileID = profileToShow.photo
            profileViewController.bio = profileToShow.bio
            profileViewController.major = profileToShow.major
            //println("From the SEGUE\(profileToShow.userID)")
    }
    }
    @IBAction func logoutOfApp(sender: UIBarButtonItem) {
        ref.unauth()
        self.performSegueWithIdentifier("goToLogin", sender: self)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
