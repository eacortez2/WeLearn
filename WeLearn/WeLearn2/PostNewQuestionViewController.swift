//
//  ViewController.swift
//  ThreadRepliesSpike
//
//  Created by Zachary Feinn on 2/18/15.
//  Copyright (c) 2015 Zachary Feinn. All rights reserved.
//

//http://makeapppie.com/2014/12/04/swift-swift-using-the-uiimagepickercontroller-for-a-camera-and-photo-library/



import AVFoundation
import UIKit

class PostNewQuestionViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate {
    
    
    var activeDiscussionType = ""
    
    var stringRef = "https://welearnhackpoly.firebaseio.com/discussions/"
    
    var artRefAdd = "art/"
    var humanitiesRefAdd = "humanities/"
    var scienceRefAdd = "science/"
    
    var myRootRef = Firebase(url:"https://welearnhackpoly.firebaseio.com/discussions/")
    
    @IBOutlet var questionText: UITextView!
    @IBOutlet var questionTaglineText: UITextField!
    
    
    @IBOutlet var postYourQuestionLabel:UILabel!

    var imageExists:BooleanType = false
    
    @IBOutlet var myImage: UIImageView!
    let picker = UIImagePickerController()
    
    @IBAction func photoFromLibrary(sender: AnyObject) {
        
        picker.allowsEditing = false //2
        picker.sourceType = .PhotoLibrary //3
        
        
        presentViewController(picker, animated: true, completion: nil)//4
        
    }
    
    
    @IBAction func shootPhoto(sender: AnyObject) {
        
        
        
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.allowsEditing = false
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            presentViewController(picker, animated: true, completion: nil)
            imageExists = true
        } else {
            noCamera()
        }
        
    }
    
    func noCamera(){
        let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style:.Default, handler: nil)
        alertVC.addAction(okAction)
        presentViewController(alertVC, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        picker.delegate = self
        
        postYourQuestionLabel.font = UIFont.italicSystemFontOfSize(15.0)
        
        
        
    }
    
    @IBOutlet var artButton: UIButton!
    @IBOutlet var humButton: UIButton!
    @IBOutlet var sciButton: UIButton!
    
    var iconChoiceDict:[String:Boolean] = ["art":0, "humanities":0, "science":0]
    
    
    var artImageUnselected = UIImage(named: "artIcon2.png")
    var humImageUnselected = UIImage(named: "humIcon2.png")
    var sciImageUnselected = UIImage(named: "sciIcon2.png")
    
    var artImageSelected = UIImage(named: "path3941.png")
    var humImageSelected = UIImage(named: "path427.png")
    var sciImageSelected = UIImage(named: "path149.png")
    
    
    @IBAction func chooseArtIcon(sender: AnyObject) {
        
        iconChoiceDict["art"] = 1
        iconChoiceDict["humanities"] = 0
        iconChoiceDict["science"] = 0
        
        println("art chosen")
        
        artButton.setImage(artImageSelected, forState: .Normal)
        humButton.setImage(humImageUnselected, forState: .Normal)
        sciButton.setImage(sciImageUnselected, forState: .Normal)
        
        activeDiscussionType = "art"
        
        myRootRef = Firebase(url:stringRef + artRefAdd)
        
        
    }
    
    @IBAction func chooseHumanitiesIcon(sender: AnyObject) {
        
        iconChoiceDict["art"] = 0
        iconChoiceDict["humanities"] = 1
        iconChoiceDict["science"] = 0
        println("humanities chosen")
        
        artButton.setImage(artImageUnselected, forState: .Normal)
        humButton.setImage(humImageSelected, forState: .Normal)
        sciButton.setImage(sciImageUnselected, forState: .Normal)
        
        activeDiscussionType = "humanities"
        
        myRootRef = Firebase(url:stringRef + humanitiesRefAdd)
        
    }
    
   
    @IBAction func chooseScienceIcon(sender: AnyObject) {
        
        iconChoiceDict["art"] = 0
        iconChoiceDict["humanities"] = 0
        iconChoiceDict["science"] = 1
        println("science chosen")
        
        artButton.setImage(artImageUnselected, forState: .Normal)
        humButton.setImage(humImageUnselected, forState: .Normal)
        sciButton.setImage(sciImageSelected, forState: .Normal)
        
        activeDiscussionType = "science"
        
        myRootRef = Firebase(url:stringRef + scienceRefAdd)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnToQuestionIndex(sender: AnyObject) {
        
        self.performSegueWithIdentifier("returnToIndexFromNewQuestion", sender: self)
        
    }
    
    
    //MARK: Delegates
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        
        var chosenImage = info[UIImagePickerControllerOriginalImage] as UIImage //2
        myImage.contentMode = .ScaleAspectFit //3
        myImage.image = chosenImage //4
        dismissViewControllerAnimated(true, completion: nil) //5
        
        imageExists = true
        
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        
        imageExists = false
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    

    
    
    @IBAction func postQuestion(sender: AnyObject) {
        
        println("posting question")
        
        var tagLine = questionTaglineText.text
        var userName = rootUser.name
        var userId = rootUser.userID
        
        var imageUrl = ""
        
        
        var date = NSDate()
        var tempTimeStr = "\(date)"
        var tempTimeAry = tempTimeStr.componentsSeparatedByString(" ")
        var returnTime = tempTimeAry[1]
        var timeStamp = returnTime
        
        if (imageExists) {
            
            println("image exists")
        
            imageUrl = parseTagLine(tagLine)
            println("image url is: " + imageUrl)
            
            imageAssetAryDict[activeDiscussionType]?.append(myImage.image!)
            
            println(imageAssetAryDict)
        }
        
        var discussionText = questionText.text
        
        
        var discussionRef = myRootRef.childByAutoId()
        
        discussionRef.setValue(["tagLine":tagLine, "userName":userName,"userId":userId,"imageUrl":imageUrl,"discussionText":discussionText,"timeStamp":timeStamp])
        
    self.performSegueWithIdentifier("returnToIndexFromNewQuestion", sender: self)
        
    }
    
    
    func parseTagLine(tagLine:String) -> String {
        
        var realTemp:[String] = []
        var temp1 = tagLine.componentsSeparatedByString(" ")
        for var i = 0; i < temp1.count; i++ {
            
            var temp2 = temp1[i].componentsSeparatedByString("'")
            for var j = 0; j < temp2.count; j++ {
                
                realTemp.append(temp2[j])
                
            }
        }
        
        var outputStr:String = ""
        
        for var i = 0; i < realTemp.count; i++ {
            
            outputStr += realTemp[i]
            
        }
        return(outputStr)
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
}

