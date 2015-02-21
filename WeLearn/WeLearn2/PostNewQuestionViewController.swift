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

class PostNewQuestionViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet var postYourQuestionLabel:UILabel!

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
    
    var iconChoiceDict:[String:Boolean] = ["art":0, "humanities":0, "science":0]
    
    
    @IBAction func chooseArtIcon(sender: AnyObject) {
        
        iconChoiceDict["art"] = 1
        iconChoiceDict["humanities"] = 0
        iconChoiceDict["science"] = 0
        println("art chosen")
        
    }
    
    @IBAction func chooseHumanitiesIcon(sender: AnyObject) {
        
        iconChoiceDict["art"] = 0
        iconChoiceDict["humanities"] = 1
        iconChoiceDict["science"] = 0
        println("humanities chosen")
        
    }
    
   
    @IBAction func chooseScienceIcon(sender: AnyObject) {
        
        iconChoiceDict["art"] = 0
        iconChoiceDict["humanities"] = 0
        iconChoiceDict["science"] = 1
        println("science chosen")
        
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
        
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    @IBAction func postQuestion(sender: AnyObject) {
        
        
        
    }
    
    
    
}

