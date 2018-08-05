//
//  RankingTableViewCell.swift
//  projetoFinal
//
//  Created by Lab on 02/08/2018.
//  Copyright © 2018 Lab. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {


    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
