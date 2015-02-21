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

class QuestionIndexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var tableView: UITableView!
    
    var stringRef = "https://welearnhackpoly.firebaseio.com/discussions"
    
    var artRefAdd = "art/"
    var humanitiesRefAdd = "humanities/"
    var scienceRefAdd = "science/"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        
        
        var defaultRef = stringRef + scienceRefAdd
        
        // Create a reference to a Firebase location
        var myRootRef = Firebase(url:defaultRef)
        // Write data to Firebase
        myRootRef.setValue("Do you have data? You'll love Firebase.")
        
        
        
    }
    
    
    
    
    @IBAction func viewArtQuestions(sender: AnyObject) {
        
        
        
    }
    
    
    @IBAction func viewHumanitiesQuestions(sender: AnyObject) {
        
        
        
    }

    
    @IBAction func viewScienceQuestions(sender: AnyObject) {
        
        
    
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
        
//        var imageName = UIImage(named: imageAssetAry[indexPath.row])
//        cell.subjectIcon.image = imageName
        
//        cell.subjectLabel.text = questionSubjectAry[indexPath.row]
        
//        cell.taglineLabel.text = taglineAry[indexPath.row]
        
//        cell.posterIdLabel.text = posterIdAry[indexPath.row]
        
//        cell.timeDateLabel.text = "test date"
//        
//        cell.answeredStatusLabel.text = "not answered"
//        
//        cell.numRepliesLabel.text = "0 replies"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("toQuestionFromIndex", sender: self)
        
    }
    
    
  
    
    @IBAction func postNewQuestionFromIndex(sender: AnyObject) {
        
        self.performSegueWithIdentifier("postNewFromIndex", sender: self)
        
    }
    
}

