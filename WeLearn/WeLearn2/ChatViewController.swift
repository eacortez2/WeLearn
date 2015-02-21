//
//  MainThreadViewController.swift
//  EventHype
//
//  Created by Zachary Feinn on 1/31/15.
//  Copyright (c) 2015 SBHacks. All rights reserved.
//

import UIKit



class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var posterIdAry:[String] = ["test1", "test2", "test3", "test4", "test5"]
    
    var taglineAry:[String] = ["Comparing Jackson Pollock to Paul Klee", "Specific heat capacity of variable density rod", "Themes of betrayal in M. Butterfly", "Integration method for matrix of ODEs", "Question about GANTT charts"]
    
    var questionSubjectAry:[String] = ["ART 104", "PHYS 123", "ENG 111", "MATH 220", "CS 180"]
    
    var imageAssetAry = ["acrylics.jpg", "BohrModel.png", "inkQuill.jpg", "integral.jpg", "linesOfCode.jpg"]
    
    //    var questionIndexAry:QuestionIndexCell = ["test question 1", "test question 2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        
        self.tableView.rowHeight = 44
        
        
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
        return self.taglineAry.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celltest", forIndexPath: indexPath) as ChatTableCell
        
 
        return cell
    }
    

    
    
    @IBAction func returnToAroundMe(sender: AnyObject) {
        
        self.performSegueWithIdentifier("returnToAroundMeFromChat", sender: self)
        
    }
    
}

