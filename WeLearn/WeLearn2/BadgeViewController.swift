//
//  BadgeViewController.swift
//  WeLearn2
//
//  Created by turbs on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView : UICollectionView!
    var badgeArray: [String]! = []
    
    let badgesArray = ["image/noob_orange", "images/coffee_badge.png", "images/experiments_badge.png"]
    
    
    func loadImages(){
        var sourcePath = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("Assets")
       // self.badgeArray = NSFileManager.defaultManager().contentsOfDirectoryAtPath(sourcePath, error: NilLiteralConvertible.self)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.badgeArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BadgeCell", forIndexPath: indexPath) as BadgeCollectionCellCollectionViewCell
        
        var imageName :String = badgeArray[indexPath.row]
        cell.badgeImageName = imageName
        
        var badgeImage: UIImage = UIImage(named: cell.badgeImageName)!
        var badgeDisplay: UIImageView = UIImageView(image: badgeImage)
        
        cell.badgeView = badgeDisplay
        
        
      //  cell.updateCell()
        
        return cell
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("UniversityCell", forIndexPath: indexPath) as UITableViewCell
//        
//        cell.textLabel?.text = universities[indexPath.row]
//        
//        if indexPath.row == selectedUniversityIndex {
//            cell.accessoryType = .Checkmark
//        } else {
//            cell.accessoryType = .None
//        }
//        
//        return cell
//    }
    
    
    
//    func setupCollectionView(){
//
//        self.collectionView.registerClass(BadgeCollectionCellCollectionViewCell.classForCoder() , forCellWithReuseIdentifier: "BadgeCell")
//    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImages()
        
 //       self.setupCollectionView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
