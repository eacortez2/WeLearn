////
////  Discussion.swift
////  WeLearn2
////
////  Created by Zachary Feinn on 2/21/15.
////  Copyright (c) 2015 com. All rights reserved.
////
//
//
//import Foundation
//
//class Discussion : NSObject {
//    var tagLine_: String
//    var posterName_: String
//    var posterID_: String
//    //var date_: NSDate
//    var imageUrl_: String?
//    var numReplies_: Int?
//    var discussionText_: String
//    
//    var timeStamp_: String
//    
//    var discussionDescriptorsDict = ["tagLine": "", "posterName": "", "netVotes": 0]
//    
//    //    convenience init(text: String?, sender: String?, netVotes: Int?) {
//    //        self.init(text: text, sender: sender, netVotes:netVotes)
//    //    }
//    
//    init(text: String?, tagLine: String?, sender: String?, imageStr: String?, timeStamp: String, subject: String) {
//        self.tagLine_ = tagLine!
//        self.discussionText_ = text!
//        self.sender_ = sender!
//        //self.date_ = nil
//        self.netVotes_ = netVotes
//        self.imageUrl_ = nil
//        self.numReplies_ = 0
//        self.timeStamp_ = timeStamp
//        
//        commentDescriptorsDict["text"] = text!
//        commentDescriptorsDict["sender"] = sender!
//        commentDescriptorsDict["netVotes"] = netVotes
//    }
//    
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
//    
//    func netVotes() -> Int! {
//        return netVotes_;
//    }
//    
//    func text() -> String! {
//        return text_;
//    }
//    
//    func sender() -> String! {
//        return sender_;
//    }
//    
//    //    func date() -> NSDate! {
//    //        return date_;
//    //    }
//    
//    func timeStamp() -> String! {
//        
//        return timeStamp_;
//        
//    }
//    
//    func imageUrl() -> String? {
//        return imageUrl_;
//    }
//}