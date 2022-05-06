//
//  CustomCellTableViewCell.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 04/05/22.
//

import UIKit

class CustomCellCaderno3: UITableViewCell {

    @IBOutlet weak var nota: UILabel!
    @IBOutlet weak var fundo: UIView!
    @IBOutlet weak var data: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.fundo.layer.cornerRadius = 10
        self.fundo.layer.borderWidth = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
