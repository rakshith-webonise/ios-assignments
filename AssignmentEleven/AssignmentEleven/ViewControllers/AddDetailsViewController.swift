//
//  AddDetailsViewController.swift
//  AssignmentEleven
//
//  Created by weboniselab1 on 21/08/2015.
//  Copyright (c) 2015 weboniselab. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddDetailsViewController : UIViewController {
    var isCalledFromPersonDetails : Bool!
    var localDictionary : Dictionary<String,AnyObject>!
    
    let keysOfPersonObject :[String] = ["firstName" , "contactNumber"]
    let keysOfOrganisation : [String] = ["organisationName" , "location"]
    var dummyNsmanagedObject : NSManagedObject!
    
    @IBOutlet weak var labelFirstNameOrOrg: UILabel!
    
    @IBOutlet weak var labelPhoneNumOrLocation: UILabel!
    
    @IBOutlet weak var textFiledFirstNameOrOrg: UITextField!
    
    @IBOutlet weak var textFiledContactNumOrLoc: UITextField!
    
    @IBOutlet weak var customNavigationItem: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        var b = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: "backButtonActionHandler")
        customNavigationItem.leftBarButtonItem = b
        initiateLabelValues()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    
    
    
    //initiate labels
    
    func initiateLabelValues(){
        if(isCalledFromPersonDetails == true){
            labelFirstNameOrOrg.text = "FirstName :"
            labelPhoneNumOrLocation.text = "Contact Number :"
        }
            
        else{
            labelFirstNameOrOrg.text = "Organisation Name :"
            labelPhoneNumOrLocation.text = "Location :"
        }
        
    }
    
    
    @IBAction func buttonSaveActionHandler(sender: UIBarButtonItem) {
        var entity : String!
        var messageForAlertView : String!
        //call makedictionary to initialize localdictionary
        if(textFiledFirstNameOrOrg.text.isEmpty){
            if(isCalledFromPersonDetails==true){
                messageForAlertView = "Enter Name"
            }
            else{
                messageForAlertView = "Enter Organisation Name"
            }
            
            alertMessage("Invalid!!", message: messageForAlertView)
        }
        else if(textFiledContactNumOrLoc.text.isEmpty){
            if(isCalledFromPersonDetails==true){
                messageForAlertView = "Enter Contact Number"
            }
            else{
                messageForAlertView = "Enter Location"
            }
            alertMessage("Invalid!!", message: messageForAlertView)
            
        }
        else {
            makeDictionary(textFiledFirstNameOrOrg.text, secondAttribute: textFiledContactNumOrLoc.text)
            if(isCalledFromPersonDetails==true){
                entity = "Person"
            }
            else{
                entity = "Organisation"
            }
            
            dummyNsmanagedObject = insertInEntity(entity,dataPairsTosave: localDictionary)
        }
        
        if(dummyNsmanagedObject == nil){
            println("error in inserting")
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func backButtonActionHandler(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
    
    func makeDictionary(firstAttribute : String,secondAttribute : String){
        localDictionary = Dictionary<String,AnyObject>()
        
        if(isCalledFromPersonDetails==true){
            localDictionary[keysOfPersonObject[0]]  = firstAttribute
            localDictionary[keysOfPersonObject[1]] = secondAttribute
        }
            
            
        else{
            localDictionary[keysOfOrganisation[0]] = firstAttribute
            localDictionary[keysOfOrganisation[1]] = secondAttribute
        }
        
        
        
    }
    
    //alertviewcontroller
    func alertMessage(title:String , message:String){
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}