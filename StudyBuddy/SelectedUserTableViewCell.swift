//
//  SelectedUserTableViewCell.swift
//  Meetup
//
//  Created by Hans Laessig on 2/5/16.
//  Copyright © 2016 Johannes Laessig. All rights reserved.
//

import UIKit

class SelectedUserTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var userInfoCell: UITextField!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var addCourseLabel: UILabel!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
