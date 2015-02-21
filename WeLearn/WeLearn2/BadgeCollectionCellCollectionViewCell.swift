//
//  BadgeCollectionCellCollectionViewCell.swift
//  WeLearn2
//
//  Created by turbs on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import UIKit

class BadgeCollectionCellCollectionViewCell: UICollectionViewCell {
    
    var badgeName: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var arrayofBadges = NSBundle.mainBundle().loadNibNamed("BadgeCell", owner: self, options: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(){
        
        
    }
}
