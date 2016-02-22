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
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookLogin(sender: AnyObject) {
        // Set permissions required from the facebook user account
        let permissionsArray = ["public_profile", "email"];
        
        // Login PFUser using Facebook
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissionsArray, block: { (user, error) -> Void in
            if ((user) == nil) {
                NSLog("Uh oh. The user cancelled the Facebook login.");
            } else if (user!.isNew) {
                NSLog("User signed up and logged in through Facebook for the first time!");
            } else {
                NSLog("User logged in through Facebook!");
            }
        })
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

