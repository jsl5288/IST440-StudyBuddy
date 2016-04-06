//
//  CourseTableViewCell.swift
//  StudyBuddy
//
//  Created by Hans Laessig on 4/5/16.
//  Copyright © 2016 IST440. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell
{
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var selectedLabel: UILabel!
    
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
