//
//  BadgeViewController.swift
//  WeLearn2
//
//  Created by turbs on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import UIKit

class BadgesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView : UICollectionView!
    var badgeArray: [String]! = []
    
    
    
    func loadImages(){
        var sourcePath = NSBundle.mainBundle().resourcePath?.stringByAppendingPathComponent("Assets")
        self.badgeArray = NSFileManager.defaultManager().contentsOfDirectoryAtPath(sourcePath, error: NSError.self)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.badgeArray.count
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImages()
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
