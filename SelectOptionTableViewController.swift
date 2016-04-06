//
//  SelectOptionTableViewController.swift
//  StudyBuddy
//
//  Created by Hans Laessig on 4/6/16.
//  Copyright © 2016 IST440. All rights reserved.
//

import UIKit
import Parse

class SelectOptionTableViewController: UITableViewController
{
    var selectedCell: String!
    var courseList = ["IST"]
    var courseName = ["301", "361", "413", "456"]
    var courseTime = ["8:00am - 9:15am"]
    var databaseName: String!
    var courseSelection: String!
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //******************TABLE VIEW FUNCTIONS*****************************
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (selectedCell == "Course")
        {
            return courseList.count
        }
        
        else if (selectedCell == "Name")
        {
            return courseName.count
        }
        
        else
        {
            return courseTime.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("optionCell") as! CourseTableViewCell
        
        if (selectedCell == "Course")
        {
            cell.selectionLabel.text = courseList[indexPath.row]
        }
            
        else if (selectedCell == "Name")
        {
            cell.selectionLabel.text = courseName[indexPath.row]
        }
            
        else
        {
            cell.selectionLabel.text = courseTime[indexPath.row]
        }
    
        self.tableView.rowHeight = 50
        
        return cell;
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let a = self.navigationController!.viewControllers[0] as! AddCourseTableViewController
        
        if (selectedCell == "Course")
        {
            courseSelection = courseList[indexPath.row]
            a.selectedCourseList[0] = courseSelection
            self.navigationController!.popToRootViewControllerAnimated(true)
        }
            
        else if (selectedCell == "Name")
        {
            courseSelection = courseName[indexPath.row]
            a.selectedCourseList[1] = courseSelection
            self.navigationController!.popToRootViewControllerAnimated(true)
        }
            
        else
        {
            courseSelection = courseTime[indexPath.row]
            a.selectedCourseList[2] = courseSelection
            self.navigationController!.popToRootViewControllerAnimated(true)
        }
    }
}
