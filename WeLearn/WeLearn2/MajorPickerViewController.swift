//
//  MajorPickerViewController.swift
//  WeLearn2
//
//  Created by turbs on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import UIKit

class MajorPickerViewController: UITableViewController {
    
    let majors = ["Computer Science", "Computer Engineering", "Liberal Arts", "Math", "Physics", "Psychology" ]
    var selectedMajor:String? = nil
    var selectedMajorIndex:Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let major = selectedMajor {
            selectedMajorIndex = find(majors, major)!
        }

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
        return majors.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MajorCell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = majors[indexPath.row]
        
        if indexPath.row == selectedMajorIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedMajorIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedMajorIndex = indexPath.row
        selectedMajor = majors[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedMajor" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedMajorIndex = indexPath?.row
            if let index = selectedMajorIndex {
                selectedMajor = majors[index]
            }
        }
    }

}
