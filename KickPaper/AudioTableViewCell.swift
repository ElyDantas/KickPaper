//
//  AudioTableViewCell.swift
//  KickPaper
//
//  Created by Student on 3/14/16.
//  Copyright © 2016 Jouderian Ferreira Nobre Junior. All rights reserved.
//

import UIKit

class AudioTableViewCell: UITableViewCell {

    @IBOutlet weak var gravacaoLabel: UILabel!
    @IBOutlet weak var numeroLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
