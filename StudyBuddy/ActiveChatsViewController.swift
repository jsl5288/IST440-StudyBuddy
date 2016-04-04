//
//  ActiveChatsViewController.swift
//  Meetup
//
//  Created by Hans Laessig on 2/23/16.
//  Copyright © 2016 Johannes Laessig. All rights reserved.
//

import Parse
import UIKit

class ActiveChatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    
    @IBOutlet weak var tableView: UITableView!
    
    var userList = [String]()
    var selectedUser = String()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.queryUsers()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //******************TABLE VIEW FUNCTIONS*****************************
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return userList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("activeChat") as! ActiveChatTableViewCell
        cell.cellNameLabel.text = userList[indexPath.row]
        cell.cellAboutLabel.text = "THIS IS A TEST \nMORE TESTING"
        self.tableView.rowHeight = 100
        
        return cell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        selectedUser = userList[row]
        self.performSegueWithIdentifier("activeChatClicked", sender: indexPath);
    }
    
    //******************************************************************
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let pUserName = PFUser.currentUser()?["username"] as? String
        
        if (segue.identifier == "activeChatClicked")
        {
            //super.prepareForSegue(segue, sender: sender)
            let navVc = segue.destinationViewController as! UINavigationController
            let chatVc = navVc.viewControllers.first as! ChatViewController
            chatVc.senderId = pUserName
            chatVc.senderDisplayName = pUserName
            chatVc.selectedUserName = selectedUser
        }
    }
    
    func queryUsers()
    {
        //Load users from Parse User database
        let query = PFUser.query()
        let pUserName = PFUser.currentUser()?["username"] as? String
        query!.whereKey("username", notEqualTo: pUserName!)
        query!.findObjectsInBackgroundWithBlock
            {
                (objects: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil
                {
                    
                    for object in objects!
                    {
                        let name = object.valueForKey("username") as! String
                        self.userList.append(name)
                        self.tableView.reloadData()
                    }
                    
                }
                else
                {
                    // Log details of the failure
                    print("Error: \(error!) \(error!.userInfo)")
                }
        }
        
    }


}
