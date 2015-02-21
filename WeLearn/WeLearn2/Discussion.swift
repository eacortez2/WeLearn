//
//  Discussion.swift
//  WeLearn2
//
//  Created by Zachary Feinn on 2/21/15.
//  Copyright (c) 2015 com. All rights reserved.
//


import Foundation

class Discussion : NSObject {
    var tagLine_: String
    var userName_: String
    var userID_: String
    //var date_: NSDate
    var imageUrl_: String?
    var numReplies_: Int?
    var discussionText_: String
    
    var timeStamp_: String
    
    var discussionDescriptorsDict = ["tagLine": "", "posterName": "", "netVotes": 0]
    
    //    convenience init(text: String?, sender: String?, netVotes: Int?) {
    //        self.init(text: text, sender: sender, netVotes:netVotes)
    //    }
    
    init(text: String?, tagLine: String?, sender: String?, imageStr: String?, timeStamp: String, subject: String, posterID: String) {
        self.tagLine_ = tagLine!
        self.discussionText_ = text!
        self.userName_ = sender!
        //self.date_ = nil
        self.imageUrl_ = nil
        self.numReplies_ = 0
        self.timeStamp_ = timeStamp
        self.userID_ = posterID
        
    }
    
//    func updateCommentDescriptorsDict(text: String?, sender: String?, netVotes:Int?) {
//        commentDescriptorsDict["text"] = text!
//        commentDescriptorsDict["sender"] = sender!
//        commentDescriptorsDict["netVotes"] = netVotes
//        
//    }
//    
//    func updateNetVotesDict(netVotes:Int?) {
//        
//        commentDescriptorsDict["netVotes"] = netVotes
//        
//    }
//    
//    func upVote() {
//        
//        if (self.netVotes_ != nil) {
//            
//            self.netVotes_! += 1
//        }
//        else {
//            self.netVotes_ = 1
//            
//        }
//        
//    }
//    
//    func downVote() {
//        
//        if (self.netVotes_ != nil) {
//            
//            self.netVotes_! -= 1
//        }
//        else {
//            self.netVotes_ = -1
//            
//        }
//        
//    }
    
//    func netVotes() -> Int! {
//        return netVotes_;
//    }
    
    func discussionText() -> String! {
        return discussionText_;
    }
    
    func userName() -> String! {
        return userName_;
    }
    
    //    func date() -> NSDate! {
    //        return date_;
    //    }
    
    func timeStamp() -> String! {
        
        return timeStamp_;
        
    }
    
    func imageUrl() -> String? {
        return imageUrl_;
    }
}