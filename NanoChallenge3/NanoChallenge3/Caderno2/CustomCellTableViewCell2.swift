//
//  CustomCellTableViewCell.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 06/05/22.
//

import UIKit

class CustomCellTableViewCell2: UITableViewCell {

    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var nota: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code\
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
