//
//  AddCourseTableViewController.swift
//  
//
//  Created by Hans Laessig on 4/6/16.
//
//

import UIKit
import Parse

class AddCourseTableViewController: UITableViewController
{
    var courseList = ["Course", "Name", "Time"]
    var selectedCourseList = ["","",""]
    var cellSelection = ""

    
    
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
    
    override func viewWillAppear(animated: Bool)
    {
        self.tableView.reloadData()
        print(selectedCourseList)
    }

    // MARK: - Table view data source

    //******************TABLE VIEW FUNCTIONS*****************************
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return courseList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("newCourseCell") as! CourseTableViewCell
        cell.selectionLabel.text = courseList[indexPath.row]
        
        if(selectedCourseList[indexPath.row] != "")
        {
            cell.selectedLabel.text = selectedCourseList[indexPath.row]
        }
        self.tableView.rowHeight = 100
        
        return cell;
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        cellSelection = courseList[indexPath.row]
        self.performSegueWithIdentifier("SelectClassView", sender: indexPath);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        if (segue.identifier == "SelectClassView")
        {
            
            let detailVC = segue.destinationViewController as! SelectOptionTableViewController;
            detailVC.selectedCell = cellSelection
        }
    }
    
    @IBAction func updateUserCourses()
    {
        if(selectedCourseList[0] != "" && selectedCourseList[1] != "" && selectedCourseList[2] != "")
        {
            let pUserName = PFUser.currentUser()?["username"] as? String
            let object = PFObject(className: "userCourses")
            object["userName"] = pUserName
            object["courseName"] = selectedCourseList[0]
            object["courseNumber"] = selectedCourseList[1]
            object["courseTime"] = selectedCourseList[2]
            object.saveInBackground()
        }
        
        else
        {
            let alert = UIAlertView(title: "Invalid", message: "Please make a selection for all three options", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
    }


}
