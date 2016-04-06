//
//  ViewController.swift
//  Meetup
//
//  Created by Hans Laessig on 1/17/16.
//  Copyright © 2016 Johannes Laessig. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var incorrectLogin: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Stay logged in
        let currentUser = PFUser.currentUser()
        if currentUser != nil
        {
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home")
                self.presentViewController(viewController, animated: true, completion: nil)
            })
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(sender: AnyObject)
    {
        let username = self.usernameField.text
        let password = self.passwordField.text
        
       
            // Run a spinner to show a task in progress
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            // Send a request to login
            PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
                
                // Stop the spinner
                spinner.stopAnimating()
                
                if ((user) != nil)
                {
                    
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home")
                        self.presentViewController(viewController, animated: true, completion: nil)
                    })
                    
                }
                
                else
                {
                    self.incorrectLogin.text = "Incorrect info"
                }
                
            })
    }
    
    
    @IBAction func unwindToLogin (segue : UIStoryboardSegue) {}


}

