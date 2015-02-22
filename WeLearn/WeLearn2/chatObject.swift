//
//  chatObject.swift
//  WeLearn2
//
//  Created by Zachary Feinn on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//

import Foundation

class chatObject:NSObject{
    
    var userID: String
    var userName: String
    var userImage: String
    var chatText: String
    
    init(id: String?, name: String?, image: String?, text: String?) {
        
        self.userID = id!
        self.userName = name!
        self.userImage = image!
        self.chatText = text!
        
    }
    
}