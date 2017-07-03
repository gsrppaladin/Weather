//
//  citiesTVCell.swift
//  Weather
//
//  Created by Sam Greenhill on 7/2/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class citiesTVCell: UITableViewCell {

    
    @IBOutlet var cityLbl: UILabel!
    
    @IBOutlet var tempLbl: UILabel!
    
    @IBOutlet var activityInd: UIActivityIndicatorView!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
