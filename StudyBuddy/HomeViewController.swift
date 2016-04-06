//
//  HomeViewController.swift
//  StudyBuddy
//
//  Created by Hans Laessig on 2/7/16.
//  Copyright © 2016 IST440. All rights reserved.
//

import Parse
import UIKit

class HomeViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileLabel: UILabel!
    var selectedCourseName = [String]()
    var selectedCourseNumber = [String]()
    var selectedCourseTime = [String]()
    
    override func viewDidLoad()
    {
        queryUserClasses()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        self.tableView.reloadData()
    }
    
    //******************TABLE VIEW FUNCTIONS*****************************
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return selectedCourseName.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("selectionCell") as! CourseTableViewCell
        cell.selectionLabel.text = "Course"
        cell.selectedLabel.text = (selectedCourseName[indexPath.row]+selectedCourseNumber[indexPath.row] + " : " + selectedCourseTime[indexPath.row])
        self.tableView.rowHeight = 100
        
        return cell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //******************************************************************
    
    @IBAction func unwindToHome(segue : UIStoryboardSegue)
    {
        
    }
    
    func queryUserClasses()
    {
        let pUserName = PFUser.currentUser()?["username"] as? String
        profileLabel.text = pUserName
        let query = PFQuery(className:"userCourses")
        query.whereKey("userName", equalTo: pUserName!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil
            {
                for object in objects!
                {
                    self.selectedCourseName.append(object["courseName"] as! String)
                    self.selectedCourseNumber.append(object["courseNumber"] as! String)
                    self.selectedCourseTime.append(object["courseTime"] as! String)
                    print(objects)
                }
            }
            
            self.tableView.reloadData()

        }
    }
}



