//
//  MainThreadViewController.swift
//  EventHype
//
//  Created by Zachary Feinn on 1/31/15.
//  Copyright (c) 2015 SBHacks. All rights reserved.
//

import UIKit





class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    var chatAry:[chatObject] = []
    
    var chatImagesDict = Dictionary<String, UIImage>()
    
    var ref = Firebase(url:"https://welearnhackpoly.firebaseio.com/chats/")
    var nearByPeople:[FireBaseUser] = []
    
    @IBOutlet var tableView: UITableView!
    
    
    //    var questionIndexAry:QuestionIndexCell = ["test question 1", "test question 2"]
    
    @IBOutlet var chatField: UITextField!
    
    
    var profileID:String = ""
    
    
    @IBAction func sendChat(sender: AnyObject) {
        
        profileID = rootUser.photo
        
        var chatRef = ref.childByAutoId()
        
    chatRef.setValue(["userID":rootUser.userID,"userName":rootUser.name,"userImage":rootUser.photo,"chatText":chatField.text])
        
        tableView.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileID = rootUser.photo
        

        
        //        self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "NewSplashBackground.png")!)
        
        self.tableView.rowHeight = 107
        
        
        
        ref.observeEventType(.ChildAdded, withBlock: { (snapshot) in
            
            let userID = snapshot.value["userID"] as? String
            let userName = snapshot.value["userName"] as? String
            let userImage = snapshot.value["userImage"] as? String
            let chatText = snapshot.value["chatText"] as? String
            
            let chatObj = chatObject(id: userID, name: userName, image: userImage, text: chatText)
            
            self.chatAry.append(chatObj)
            
            self.tableView.reloadData()
            
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
        return chatAry.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celltest", forIndexPath: indexPath) as ChatTableCell
        
        var correctAryPosition = chatAry.count - indexPath.row - 1
        
        
        cell.backgroundColor = UIColor.clearColor()
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        if (chatAry[correctAryPosition] == []) {
            println("no data yet")
        } else {
        cell.profPictureView.profileID = chatAry[correctAryPosition].userImage
            
        cell.chatTextLabel?.text = chatAry[correctAryPosition].chatText
        }
 
        return cell
    }
    

    
    
    @IBAction func returnToAroundMe(sender: AnyObject) {
        
        self.performSegueWithIdentifier("returnToAroundMe", sender: self)
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
}

