//
//  CustomTableViewCell.swift
//  InstaGram
//
//  Created by Kanybek Zhagusaev on 2/11/16.
//  Copyright © 2016 ksabbak. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageVW: UIImageView!
   
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
