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
    
    //    var questionIndexAry:QuestionIndexCell = ["test question 1", "test question 2"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.rowHeight = 107

        //        self.tableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        
        
        
        
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
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celltest", forIndexPath: indexPath) as UITableViewCell
        
        return cell
    }
    
    
    
    
    @IBAction func returnToAroundMe(sender: AnyObject) {
        
        self.performSegueWithIdentifier("returnToAroundMeFromChat", sender: self)
        
    }
    
}

