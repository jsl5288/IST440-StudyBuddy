//
//  ActiveChatTableViewCell.swift
//  Meetup
//
//  Created by Hans Laessig on 2/23/16.
//  Copyright © 2016 Johannes Laessig. All rights reserved.
//

import UIKit

class ActiveChatTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellAboutLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
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
