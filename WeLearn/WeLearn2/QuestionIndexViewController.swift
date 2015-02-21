//
//  MainThreadViewController.swift
//  EventHype
//
//  Created by Zachary Feinn on 1/31/15.
//  Copyright (c) 2015 SBHacks. All rights reserved.
//

import UIKit


var currQuestionId:String = ""


var imageAssetAryDict:[String:[UIImage]] = ["art":[], "humanities":[], "science":[]]

var discussionAry:[Discussion] = []

class QuestionIndexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var tableView: UITableView!
    
    var stringRef = "https://welearnhackpoly.firebaseio.com/discussions/"
    
    var artRefAdd = "art/"
    var humanitiesRefAdd = "humanities/"
    var scienceRefAdd = "science/"
    
    
    @IBOutlet var currCategoryIcon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        
        var currentRef = scienceRefAdd
        var defaultRef = stringRef + currentRef
        currCategoryIcon.image = scienceImage
        
        // Create a reference to a Firebase location
        var myRootRef = Firebase(url:defaultRef)
        
            myRootRef.observeEventType(.ChildAdded, withBlock: { (snapshot) in
                
                println("now observing snapshot")
                let tagLine = snapshot.value["tagLine"] as? String
                
                let userName = snapshot.value["userName"] as? String
                let timeStamp = snapshot.value["timeStamp"] as? String
                let answeredStatus = "Unanswered"
                let numReplies = 0
                
//                var text:String
//                text = snapshot.value["discussionText"]? as String
                let userId = snapshot.value["userId"] as String
                
                let discussion = Discussion(text: "placeHolder text", tagLine: tagLine, sender: userName, imageStr: "", timeStamp: timeStamp!, subject: currentRef, posterID: userId)
                
                discussionAry.append(discussion)
                
                println(discussionAry)
                
//                self.messagesRefAry.append(snapshot.key)
//                println(self.messagesRefAry)
//                
//                //            println(timestampRead)
//                //            println(netVotes)
//                
//                let comment = Comment(text: text, sender: sender, netVotes: netVotes, timeStamp:timeStamp!)
//                self.messagesAry.append(comment)
//                println(comment)
                
                
                
                //Note that the strong self causes a memory leak!

                self.tableView.reloadData()
            })
        
        
        
        
        
    }
    
    
    
    var artImage = UIImage(named: "artIcon2.png")
    var humanitiesImage = UIImage(named: "humIcon2.png")
    var scienceImage = UIImage(named: "sciIcon2.png")
    
    
    @IBAction func viewArtQuestions(sender: AnyObject) {
        
        var myRootRef = Firebase(url:stringRef + artRefAdd)
        // Write data to Firebase
        
        currCategoryIcon.image = artImage
        
        tableView.reloadData()
        
    }
    
    
    @IBAction func viewHumanitiesQuestions(sender: AnyObject) {
        
        var myRootRef = Firebase(url:stringRef + humanitiesRefAdd)
        // Write data to Firebase
        
        currCategoryIcon.image = humanitiesImage
        
        tableView.reloadData()
        
    }

    
    @IBAction func viewScienceQuestions(sender: AnyObject) {
        
        var myRootRef = Firebase(url:stringRef + scienceRefAdd)
        // Write data to Firebase
    
        currCategoryIcon.image = scienceImage
        
        tableView.reloadData()
        
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
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celltest", forIndexPath: indexPath) as QuestionIndexCell
        
                println("yes cells are loading")
        println(discussionAry)
        
//        cell.subjectLabel.text = discussionAry[indexPath.row].discussionText()
        
        cell.taglineLabel.text = discussionAry[indexPath.row].tagLine()
        
        cell.posterNameLabel.text = discussionAry[indexPath.row].userName()
        
        cell.timeDateLabel.text = discussionAry[indexPath.row].timeStamp()
        
        cell.answeredStatusLabel.text = "Unanswered"
        
        cell.numRepliesLabel.text = "0 replies"
        

        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("toQuestionFromIndex", sender: self)
        
    }
    
    
  
    
    @IBAction func postNewQuestionFromIndex(sender: AnyObject) {
        
        self.performSegueWithIdentifier("postNewFromIndex", sender: self)
        
    }
    
}

