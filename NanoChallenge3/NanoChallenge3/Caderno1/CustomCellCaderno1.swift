//
//  CustomCellCaderno1.swift
//  NanoChallenge3
//
//  Created by Vinicius Gomes on 11/05/22.
//

import UIKit

class CustomCellCaderno1: UITableViewCell {

    @IBOutlet weak var nota: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var fundo: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.fundo.layer.cornerRadius = 10
        self.fundo.layer.borderWidth = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
