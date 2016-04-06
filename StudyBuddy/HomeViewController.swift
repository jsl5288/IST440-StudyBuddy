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
    var selectedCourseList = ["IST 301 : 8:00am - 9:15am", "IST 456 : 2:30pm - 3:45pm"]
    
    //******************TABLE VIEW FUNCTIONS*****************************
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return selectedCourseList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("selectionCell") as! CourseTableViewCell
        cell.selectionLabel.text = "Course"
        cell.selectedLabel.text = selectedCourseList[indexPath.row]
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
}



