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
    
    
    @IBOutlet var myImage: UIImageView!
    let picker = UIImagePickerController()
    
    @IBAction func photoFromLibrary(sender: AnyObject) {
        
        picker.allowsEditing = false //2
        picker.sourceType = .PhotoLibrary //3
        
        
        picker.modalPresentationStyle = .Popover
        presentViewController(picker, animated: true, completion: nil)//4
        picker.popoverPresentationController?.barButtonItem = sender as UIBarButtonItem
        
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
    
}
