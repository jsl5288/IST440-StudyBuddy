//
//  SecondSetupViewController.swift
//  Meetup
//
//  Created by Hans Laessig on 2/8/16.
//  Copyright © 2016 Johannes Laessig. All rights reserved.
//

import UIKit
import Parse

class SetupViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet var tableView: UITableView!
    
    var studentInfo = [String]()
    var studentData = [String]()
    var newStudentData = [String]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.fillArrays()
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillArrays()
    {
        //labels array
        self.studentInfo.append("FirstName")
        self.studentInfo.append("LastName")
        self.studentInfo.append("YearStanding")
        self.studentInfo.append("Major")
        
        //data array
        self.studentData.append("")
        self.studentData.append("")
        self.studentData.append("")
        self.studentData.append("")
        
        //data array
        self.newStudentData.append("")
        self.newStudentData.append("")
        self.newStudentData.append("")
        self.newStudentData.append("")
        
        self.tableView.reloadData()
    }
    
    
    //******************TABLE VIEW FUNCTIONS*****************************
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return studentInfo.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell") as! SelectedUserTableViewCell
        
        cell.userInfoCell.placeholder = studentInfo[row]
        studentData[row] = cell.userInfoCell.text!
        cell.userInfoCell.text = newStudentData[row]
        
        return cell
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    
    //***********************UPDATE PROFILE INFO************************
    @IBAction func updateProfile(sender: AnyObject)
    {
        self.tableView.reloadData()
        
        let pUserName = PFUser.currentUser()?["username"] as? String
        
        let query = PFQuery(className: "Profile")
        query.whereKey("name", equalTo: pUserName!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if(objects != nil)
            {
                
                for object in objects!
                {

                    object["name"] = pUserName
                    object["firstName"] = self.studentData[0]
                    object["lastName"] = self.studentData[1]
                    object["yearStanding"] = self.studentData[2]
                    object["major"] = self.studentData[3]
                    object.saveInBackground()
                }
            }
                
            else
            {
                print("SHITS FUCKED UPDATING PROFILE IN SETTINGS")
            }
        }
    
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home")
            self.presentViewController(viewController, animated: true, completion: nil)
        })

    }
    //******************************************************************



}