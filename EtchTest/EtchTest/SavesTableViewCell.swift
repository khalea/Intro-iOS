//
//  SavesTableViewCell.swift
//  EtchTest
//
//  Created by Khalea Berry on 4/28/19.
//  Copyright © 2019 C323 Spring 2019 - kjberrys. All rights reserved.
//

import UIKit

class SavesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photo: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var info: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
