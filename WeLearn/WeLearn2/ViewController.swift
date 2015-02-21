//
//  ViewController.swift
//  WeLearn2
//
//  Created by Russ Fenenga on 2/20/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import UIKit

var rootUser: FireBaseUser = FireBaseUser(name: " ", major: " ", photo: " ", bio: " ")

class ViewController: UIViewController, FBLoginViewDelegate {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet var fbLoginView : FBLoginView!
    @IBOutlet var fbProfilePic : FBProfilePictureView!
    var rootRef = Firebase(url:"https://welearnhackpoly.firebaseio.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var rootRef = Firebase(url:"https://welearnhackpoly.firebaseio.com")
        // Write data to Firebase
        //rootRef.setValue("Do you have data? You'll love Firebase.")
        fbLoginView.delegate = self
        fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        //println("User Logged In")
        println("This is where you perform a segue.")
        performSegueWithIdentifier("loginSegue", sender: self)
        
    }
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        var downloadGroup = dispatch_group_create()
        var userID:String = ""
        var keys = [String]()
        var keyCount: UInt = 0
        var accountAlreadyCreated = false
        var rootRef = Firebase(url:"https://welearnhackpoly.firebaseio.com")
        //println("User Name: \(user.name)")
        //println("\(user.objectID)")
        //let avatarLocation = "http://graph.facebook.com/\(user.objectID)/picture?type=large"
        self.fbProfilePic.profileID = user.objectID
        var fbAccessToken = FBSession.activeSession().accessTokenData.accessToken
        rootRef.authWithOAuthProvider("facebook", token: fbAccessToken,
            withCompletionBlock: { error, authData in
                if error != nil {
                    //println("Login failed. \(error)")
                } else {
                    //println("Logged in! \(authData)")
                    userID = authData.uid
                    rootUser.provider = authData.provider
                    rootUser.email = authData.providerData["email"] as String
                    rootUser.name = user.first_name as String
                    rootUser.photo = user.objectID
                    var ref = Firebase(url:"https://welearnhackpoly.firebaseio.com/users")
                    ref.queryOrderedByKey().observeEventType(.ChildAdded, withBlock: { snapshot in
                        keyCount++
                        println("\(snapshot.key)")
                        keys.append(snapshot.key)
                    })
                }
                rootRef.observeEventType(.Value, withBlock: { snapshot in
                    //println("\(keyCount)")
                    //println("\(snapshot.childrenCount)")
                    //println("initial data loaded! \(keyCount == snapshot.childrenCount)")
                    println("\(keys.count)")
                    for key in keys {
                        if(userID == key){
                            accountAlreadyCreated=true
                        }
                    }
                    if(accountAlreadyCreated==false){
                        var newUserTest: FireBaseUser = FireBaseUser(name: " ", major: " ", photo: " ", bio: " ")
                        
                        // the next line is where the error in unwrapping occurs
                        if (authData != nil) {
                        newUserTest.provider = authData.provider
                        
                        newUserTest.email = authData.providerData["email"] as String
                        newUserTest.name = user.first_name as String
                        newUserTest.photo = user.objectID
                        
//                        rootUser.provider = authData.provider
//                        rootUser.email = authData.providerData["email"] as String
//                        rootUser.name = user.first_name as String
//                        rootUser.photo = user.objectID
                        
                        let newUser = [
                            "provider": newUserTest.provider,
                            "email": newUserTest.email,
                            "first_name": newUserTest.name,
                            "major": newUserTest.major,
                            "photoID": newUserTest.photo,
                            "rep": newUserTest.rep,
                            "location": newUserTest.location,
                            "bio": newUserTest.bio,
                            "badges": newUserTest.badges,
                            "provider": authData.provider,
                            //"email": authData.providerData["email"] as NSString,
                            //"first_name": user.first_name as NSString
                        ]
                        rootRef.childByAppendingPath("users")
                            .childByAppendingPath(authData.uid).setValue(newUser)
                    }
                        
                    }
                    
                })
        })
        //println("\(accountAlreadyCreated)")
        
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
        self.fbProfilePic.profileID = nil
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createNewUser(){
        
    }
    
    
    
}

