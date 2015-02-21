//
//  user.swift
//  hackPolyClasses
//
//  Created by turbs on 2/20/15.
//  Copyright (c) 2015 turbs. All rights reserved.
//

import Foundation


class FireBaseUser {
    
    var name: String
    var major: String
    var photo: String   //must be stored as a string for the file name
    var rep: Int
    var location: [Double]
    var bio: String
    var badges: [String]
    var radius: Int
    var provider: String
    var email: String
    var userID: String
    var school: String
    
    
    init(name: String, major: String, photo:String, bio: String){
        self.name = name
        self.major = "Computer Science"
        self.photo = photo
        self.rep = 0
        self.location = []
        self.bio = bio
        self.badges = []
        self.radius = 5  //default is a 5 mile radius
        self.provider=""
        self.email = ""
        self.userID = ""
        self.school = "Santa Barbara City College"
    }
    
        
    func incrementRep(){
            rep++
    }
    
    func decrementRep(){
        rep--
    }
    
}
